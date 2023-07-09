import mysql.connector as db
from datetime import datetime
from numpy import random
import numpy as np

database=db.connect(host="localhost",user="root",passwd="root",database="wishlist")
cursor=database.cursor(buffered=True)
cursor.execute("SHOW TABLES")
d=cursor.fetchall()   
 
def addproduct(id):
    cur=database.cursor(buffered=True)
    cur.execute("savepoint add_prod")
    qty=int(input("Enter number of product you wish to add : "))
    q=("SELECT * FROM cart where customer_id=%s")
    cur.execute(q,[id])
    f=True
    if not cur.fetchall():
        f=False
    if f:
        #cur=database.cursor(buffered=True)
        q="UPDATE cart set no_of_items=no_of_items+%s where customer_id=%s"
        cur.execute(q,[qty,id])
        #database.commit()
    else:
        #cur=database.cursor(buffered=True)
        q="INSERT INTO cart VALUES(%s,%s)"
        cur.execute(q,[id,qty])
        #database.commit()
    #database.commit()
    for i in range(qty):
        s=input("Enter ID of the product you want to add : ")
        n=int(input("Enter quantity : "))
        #cur=database.cursor(buffered=True)
        q="SELECT Name FROM product where Product_ID=%s"
        cur.execute(q,[s])
        if not cur.fetchall():
            print("Product not found")
            break
        
        #cur=database.cursor(buffered=True)
        q="SELECT Name FROM product where Product_ID=%s"
        cur.execute(q,[s])
        name=""
        for x in cur:
            name=x[0]
        #cur=database.cursor(buffered=True)
        cur.execute("SELECT S_No FROM cart_items ORDER BY S_No DESC LIMIT 1")
        for x in cur:
            if x=="":
                sn=1
            else:
                sn=x[0]+1
        #cur=database.cursor(buffered=True)
        q="INSERT into cart_items VALUES(%s,%s,%s,%s,%s)"
        cur.execute(q,[s,id,name,n,sn])
        #database.commit()
        q="SELECT Quantity FROM product where Product_ID=%s"
        cur.execute(q,[s])
        quant=cur.fetchone()[0]
        if quant<n:
            print("Insufficient quantity")
            cur.execute("ROLLBACK to add_prod")
            cur.execute("RELEASE savepoint add_prod")
        else:
            cur.execute("COMMIT")
        

while(1):
    print('''Welcome to WISHLIST :-
Who do you want to login
    1. Admin
    2. Sales Manager
    3. Manufacturer
    4. Delivery Partner
    5. Customer 
    6. Exit''')
    option=int(input("Enter the integer corresponding to your choice : "))
    if(option==1):
        un=input("Enter your username : ")
        if(un=="prerak"):
            adid="A001"
        else:
            adid="A002"
        cur=database.cursor(buffered=True)
        qry="SELECT * FROM admin where username=%s"
        cur.execute(qry,[un])
        if not cur.fetchall():
            print("Not Found")
            break
        pwd=input("Enter your password : ")
        qry="SELECT * FROM admin where username=%s and password=%s"
        cur.execute(qry,[un , pwd])
        actual = cur.fetchall()
        if not actual:
            print("Incorrect password")
            break
        print("Login successfull")
        
        while(1):
            print("Choose an action.")
            print('''    1. Browse customer list
    2. Browse sales manager list
    3. Browse manufacturer list
    4. Browse delivery partner list
    5. Appoint sales manager
    6. Remove sales manager
    7. OLAP Queries
    8. Exit''')
            opt=int(input("Enter your choice : "))
            if(opt==1):
                cur=database.cursor(buffered=True)
                cur.execute("SELECT Customer_ID, Customer_type, Customer_First_Name, Customer_Last_Name, Email FROM customer")
                print("ID\t\t Type" , " " * 16 , "Name" , " " * 27 , "E-mail")
                for i in cur:
                    print(i[0] , "\t\t" , i[1] , " " * (20 - len(i[1])) , i[2] , i[3] , " " * (30 - len(i[3]) - len(i[2])) , i[4])
            if(opt==2):
                cur=database.cursor(buffered=True)
                qry=("SELECT Sales_manager_ID, First_name, Last_name, Email FROM sales_manager where Admin_ID=%s")
                cur.execute(qry,[adid])
                print("ID\t\t Name" , " " * 27 , "E-mail")
                for i in cur:
                    print(i[0] , "\t\t" , i[1] , i[2] , " " * (30 - len(i[1]) - len(i[2])) , i[3])
            if(opt==3):
                cur=database.cursor(buffered=True)
                qry=("SELECT Manufacturer_ID, Name, Email FROM manufacturer")
                cur.execute(qry)
                print("ID\t\t Name" , " " * 27 , "E-mail")
                for i in cur:
                    print(i[0] , "\t\t" , i[1] , " " * (40 - len(i[1])) , i[2])
            if(opt==4):
                cur=database.cursor(buffered=True)
                qry=("SELECT Delivery_Partner_ID, First_Name, Last_Name, Email FROM delivery_partner")
                cur.execute(qry)
                print("ID\t\t Name" , " " * 27 , "E-mail")
                for i in cur:
                    print(i[0] , "\t\t" , i[1] , i[2] , " " * (30 - len(i[1]) - len(i[2])) , i[3])
            if(opt==5):
                cur=database.cursor(buffered=True)
                fname = input("Enter the first name : ")
                lname = input("Enter the last name  : ")
                email = input("Enter the E-mail     : ")
                mobile = input("Enter the Mobile No. : ")
                cur.execute("SAVEPOINT add_manager")
                qry=("SELECT Sales_manager_ID from sales_manager ORDER BY Sales_manager_ID DESC limit 1")
                cur.execute(qry)
                for i in cur:
                    id = i[0]
                newid = id[0] + str(int(id[1:]) + 1)
                #cur=database.cursor(buffered=True)
                qry = ("INSERT into sales_manager values(%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cur.execute(qry,[newid , fname , lname , email , mobile , 0 , 0 , 0 , adid])
                #database.commit()
                q="SELECT COUNT(*) FROM sales_manager where Mobile_No=%s"
                cur.execute(q,[mobile])
                phn=cur.fetchone()[0]
                if phn>1:
                    print("Manager with same phone number already exists")
                    cur.execute("ROLLBACK to add_manager")
                    cur.execute("RELEASE savepoint add_manager")
                else:
                    print("Sales Manager added.")
                    cur.execute("COMMIT")
                    
            if(opt==6):
                cur=database.cursor(buffered=True)
                id = input("Enter the Sales Manager ID : ")
                qry=("DELETE from sales_manager where Sales_manager_ID = %s")
                cur.execute(qry , [id])
                database.commit()
                print("Sales Manager removed.")
            if(opt==7):
                while(1):
                    print("1. Number of customers on the basis of particular type and gender")
                    print("2. Number of products of specific category")
                    print("3. Number of products manufactured of every category by the manufacture")
                    print("4. Total sales of each admin")
                    print("5. Exit")
                    op=int(input("Enter your choice : "))
                    if(op==1):
                        cur=database.cursor(buffered=True)
                        cur.execute('''select Customer_type , Gender , count(*) from customer group by Customer_type , Gender with rollup union
                            select Customer_type , Gender , count(*) from customer group by Gender , Customer_type with rollup''')
                        print("Customer_Type    Gender      Number of customers")
                        for x in cur:
                            print(x[0] , x[1] , x[2])

                    elif(op==2):
                        cur=database.cursor(buffered=True)
                        cur.execute('''select Name , Category_ID , sum(Quantity) from product group by Category_ID , name with rollup''')
                        print("Name Category Quantity")
                        for x in cur:
                            print(x[0] , x[1] , x[2])
                    
                    elif(op==3):
                        cur=database.cursor(buffered=True)
                        cur.execute('''select name , Product_category , sum(Number_of_products) from manufacturer group by Product_category , Name with rollup''')
                        print("Name Product_Category Number of products")
                        for x in cur:
                            print(x[0] , x[1] , x[2])
                    elif(op==4):
                        cur=database.cursor(buffered=True)
                        cur.execute(''' select a.username , s.Sales_manager_ID , sum(s.Payments) from admin as a INNER JOIN sales_manager as s
                                    on a.Admin_ID = s.Admin_ID group by a.username , s.Sales_manager_ID with rollup''')
                        print("Name Product_Category Number of products")
                        for x in cur:
                            print(x[0] , x[1] , x[2])
                    else:
                        break
            else:
                break   
        
    elif(option==2):
        un=input("Enter your S_ID : ")
        cur=database.cursor(buffered=True)
        qry="SELECT * FROM sales_manager where Sales_manager_ID=%s"
        cur.execute(qry,[un])
        if not cur.fetchall():
            print("Not Found")
            break
        pwd=input("Enter your mobile number : ")
        qry="SELECT * FROM sales_manager where Sales_manager_ID=%s and Mobile_No=%s"
        cur.execute(qry,[un,pwd])
        actual = cur.fetchall()
        if not actual:
            print("Incorrect password")
            break
        print("Login successfull")
        while(1):
            print("Choose an action.")
            print('''    1. Browse manufacturer list
    2. Browse delivery partner list
    3. Exit''')
        opt=int(input("Enter your choice : "))
        if(opt==1):
            cur=database.cursor(buffered=True)
            qry=("SELECT Manufacturer_ID, Name, Email FROM manufacturer")
            cur.execute(qry)
            print("ID\t\t Name" , " " * 27 , "E-mail")
            for i in cur:
                print(i[0] , "\t\t" , i[1] , " " * (40 - len(i[1])) , i[2])
                
        elif(opt==2):
            cur=database.cursor(buffered=True)
            qry=("SELECT Delivery_Partner_ID, First_Name, Last_Name, Email FROM delivery_partner")
            cur.execute(qry)
            print("ID\t\t Name" , " " * 27 , "E-mail")
            for i in cur:
                print(i[0] , "\t\t" , i[1] , i[2] , " " * (30 - len(i[1]) - len(i[2])) , i[3])
        else:
            break
        
    elif(option==3):
        un=input("Enter your M_ID : ")
        cur=database.cursor(buffered=True)
        qry="SELECT * FROM manufacturer where Manufacturer_ID=%s"
        cur.execute(qry,[un])
        if not cur.fetchall():
            print("Not Found")
            break
        pwd=input("Enter your mobile number : ")
        qry="SELECT * FROM manufacturer where Manufacturer_ID=%s and Phone_No=%s"
        cur.execute(qry,[un,pwd])
        actual = cur.fetchall()
        if not actual:
            print("Incorrect password")
            break
        print("Login successfull")
        while(1):
            print("1. Add product")
            print("2. Update product")
            print("3. Delete product")
            print("4. Exit")
            opt=int(input("Enter your choice : "))
            if(opt==1):
                name=input("Enter name of the product : ")
                quantity=int(input("Enter quantity of the product : "))
                price=int(input("Enter price of the product : "))
                desc=input("Enter description of the product : ")
                cat_name=input("Enter name of the category of the product : ")
                num=cat_name[-1]
                cat_id="C00"+str(num)
                mfg_date=input("Enter manufacturing date of the product : ")
                cur=database.cursor(buffered=True)
                qry=("SELECT Product_ID from product ORDER BY Product_ID DESC limit 1")
                cur.execute(qry)
                for i in cur:
                    id = i[0]
                newid = id[0] + str(int(id[1:]) + 1)
                
                qry="SELECT Name FROM manufacturer where Manufacturer_ID=%s"
                cur=database.cursor(buffered=True)
                cur.execute(qry,[un])
                mfg_name=cur.fetchone()[0]
                qry="INSERT into product VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cur.execute(qry,[newid,name,quantity,price,desc,cat_name,cat_id,mfg_date,mfg_name])
                database.commit()

            elif opt==2:
                print("1. Update quantity")
                print("2. Update price")
                print("3. Exit")
                op=int(input("Enter your choice : "))
                if(op==1):
                    id=input("Enter Product ID of the product you wish to update : ")
                    qty=int(input("Enter the new updated quantity : "))
                    cur=database.cursor(buffered=True)
                    qry="UPDATE product SET Quantity=%s where Product_ID=%s"
                    cur.execute(qry,[qty,id])
                    database.commit()
                    
                elif(op==2):
                    id=input("Enter Product ID of the product you wish to update : ")
                    qty=int(input("Enter the new updated price : "))
                    cur=database.cursor(buffered=True)
                    qry="UPDATE product SET Price=%s where Product_ID=%s"
                    cur.execute(qry,[qty,id])
                    database.commit()
            
            elif opt==3:
                id=input("Enter id of the product you want to delete")
                cur=database.cursor(buffered=True)
                qry="DELETE FROM product where Product_ID=%s"
                cur.execute(qry,[id])
                database.commit()
                 
            else:
                break
        
    elif(option==4):
        un=input("Enter your D_ID : ")
        cur=database.cursor(buffered=True)
        qry="SELECT * FROM delivery_partner where Delivery_Partner_ID=%s"
        cur.execute(qry,[un])
        if not cur.fetchall():
            print("Not Found")
            break
        pwd=input("Enter your mobile number : ")
        qry="SELECT * FROM delivery_partner where Delivery_Partner_ID=%s and Mobile_No=%s"
        cur.execute(qry,[un,pwd])
        actual = cur.fetchall()
        if not actual:
            print("Incorrect password")
            break
        print("Login successfull")
        
        while(1):
            print("1. Browse order summary")
            print("2. Update status")
            print("3. Exit")
            opted=int(input("Enter your choice : "))
            if(opted==1):
                cur=database.cursor(buffered=True)
                qry="SELECT Number_of_Orders,Orders_delivered,Orders_picked_up,Orders_left,Payment_received FROM delivery_partner where Delivery_Partner_ID=%s"
                print("Total Orders     Delivered       Picked_up       left        Payments_received")
                cur.execute(qry,[un])
                for i in cur:
                    print(i[0],"\t\t",i[1],"\t\t",i[2],"\t\t",i[3],"\t\t",i[4])
                
            elif(opted==2):
                cur=database.cursor(buffered=True)
                qry="Select order_ID,Status from orders where Delivery_partner_ID=%s"
                cur.execute(qry,[un])
                print("Order_ID     Status")
                for i in cur:
                    print(i[0],"\t",i[1])
                    
                q=input("Do you wish to change status of the order (Y/N) : ")
                if(q=="Y"):
                    oid=input("Enter order ID whose status you want to update : ")
                    newstatus=input("Enter the new status for the order : ")
                    cur=database.cursor(buffered=True)
                    qry="UPDATE orders SET Status=%s where order_ID=%s"
                    cur.execute(qry,[newstatus,oid])
                    database.commit()
                else:
                    break
            else:
                break
        
        
    elif(option==5):
        print("Welcome :- ")
        print("1. Sign up")
        print("2. Sign in")
        print("3. Exit")
        op=int(input("Enter your choice : "))
        custid=""
        if(op == 1):
            fname = input("Enter first name : ")
            lname = input("Enter last name  : ")
            add   = input("Enter address    : ")
            dob   = input("Enter DOB        : ")
            age   = int(input("Enter age        : "))
            email = input("Enter E-mail     : ")
            mobile= input("Enter mobile no. : ")
            gender= input("Enter gender     : ")
            pwd   = input("Enter password   : ")
            cur=database.cursor(buffered=True)
            qry=("SELECT Customer_ID from customer ORDER BY Customer_ID DESC limit 1")
            cur.execute(qry)
            for i in cur:
                id = i[0]
            newid = id[0] + str(int(id[1:]) + 1)
            cur=database.cursor(buffered=True)
            qry = ("INSERT into customer values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cur.execute(qry,[newid , 'Normal' , fname , lname , add , dob , age , email , mobile , gender , pwd])
            database.commit()
            print("Successfully registered!")
            custid=newid
        elif(op == 2):
            un=input("Enter your email id : ")
            cur=database.cursor(buffered=True)
            qry="SELECT * FROM customer where Email=%s"
            cur.execute(qry,[un])
            if not cur.fetchall():
                print("Not Found")
                break
            pwd=input("Enter your password : ")
            qry="SELECT * FROM customer where Email=%s and password=%s"
            cur.execute(qry,[un,pwd])
            actual = cur.fetchall()
            if not actual:
                print("Incorrect password")
                break
            print("Login successfull")
            cur=database.cursor(buffered=True)
            qry="SELECT * FROM customer where Email=%s and password=%s"
            cur.execute(qry,[un,pwd])
            for x in cur:
                custid=x[0]
        else:
            break
        while(1):
            print('''    1. Browse/add products
    2. Update cart
    3. View order
    4. Place order
    5. Exit''')   
            inp=int(input("Enter your choice : "))
            if(inp==1):
                cur=database.cursor(buffered=True)
                cur.execute("SELECT DISTINCT(Category_name) FROM product")
                print("1. Electronics")  
                print("2. Clothes")  
                print("3. Food and Beverages")  
                print("4. Footwear")  
                print("5. Sports")
                print("6. Exit")
                x=int(input("Enter your choice : "))
                if(x==1):
                    cur=database.cursor(buffered=True)  
                    cur.execute("SELECT Product_ID, Name, Quantity, Price, Description, Manufacturer FROM product where Category_name='cat1'")
                    print("Product_ID   Product_Name" , " " * 18 , "Quantity" , " " * 7 , "Price" , " " * 5, "Description" , " " *  9 , "Manufacturer")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (30 - len(x[1])) ,x[2]," " * (15 - len(str(x[2]))),x[3]," " * (10 - len(str(x[3]))),x[4]," " * (20 - len(x[4])),x[5]) 
                    s=input("Do you wish to add product to the cart (Y/N): ")
                    if(s=='Y'):
                        addproduct(custid)
                        
                elif(x==2):
                    cur=database.cursor(buffered=True)  
                    cur.execute("SELECT Product_ID, Name, Quantity, Price, Description, Manufacturer FROM product where Category_name='cat2'")
                    print("Product_ID   Product_Name" , " " * 18 , "Quantity" , " " * 7 , "Price" , " " * 5, "Description" , " " *  9 , "Manufacturer")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (30 - len(x[1])) ,x[2]," " * (15 - len(str(x[2]))),x[3]," " * (10 - len(str(x[3]))),x[4]," " * (20 - len(x[4])),x[5])
                    s=input("Do you wish to add product to the cart (Y/N): ")
                    if(s=='Y'):
                        addproduct(custid)
                        
                elif(x==3):
                    cur=database.cursor(buffered=True)  
                    cur.execute("SELECT Product_ID, Name, Quantity, Price, Description, Manufacturer FROM product where Category_name='cat3'")
                    print("Product_ID   Product_Name" , " " * 18 , "Quantity" , " " * 7 , "Price" , " " * 5, "Description" , " " *  9 , "Manufacturer")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (30 - len(x[1])) ,x[2]," " * (15 - len(str(x[2]))),x[3]," " * (10 - len(str(x[3]))),x[4]," " * (20 - len(x[4])),x[5])
                    s=input("Do you wish to add product to the cart (Y/N): ")
                    if(s=='Y'):
                        addproduct(custid)
                        
                elif(x==4):
                    cur=database.cursor(buffered=True)  
                    cur.execute("SELECT Product_ID, Name, Quantity, Price, Description, Manufacturer FROM product where Category_name='cat4'")
                    print("Product_ID   Product_Name" , " " * 18 , "Quantity" , " " * 7 , "Price" , " " * 5, "Description" , " " *  9 , "Manufacturer")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (30 - len(x[1])) ,x[2]," " * (15 - len(str(x[2]))),x[3]," " * (10 - len(str(x[3]))),x[4]," " * (20 - len(x[4])),x[5])
                    s=input("Do you wish to add product to the cart (Y/N): ")
                    if(s=='Y'):
                        addproduct(custid)
                        
                elif(x==5):
                    cur=database.cursor(buffered=True)  
                    cur.execute("SELECT Product_ID, Name, Quantity, Price, Description, Manufacturer FROM product where Category_name='cat5'")    
                    print("Product_ID   Product_Name" , " " * 18 , "Quantity" , " " * 7 , "Price" , " " * 5, "Description" , " " *  9 , "Manufacturer")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (30 - len(x[1])) ,x[2]," " * (15 - len(str(x[2]))),x[3]," " * (10 - len(str(x[3]))),x[4]," " * (20 - len(x[4])),x[5])
                    s=input("Do you wish to add product to the cart (Y/N): ")
                    if(s=='Y'):
                        addproduct(custid)
                        
                else:
                    break
                
            elif(inp==2):
                print("1. View Cart")
                print("2. Delete product")
                print("3. Exit")
                x=int(input("Enter your choice : "))
                if(x==1):
                    cur=database.cursor(buffered=True) 
                    q=("SELECT product_id, product_name, quantity FROM cart_items where customer_id=%s")
                    cur.execute(q,[custid])
                    print("Product_ID   Product_Name" , " " * 10 , "Quantity")
                    for x in cur:
                        print(x[0] ," " * 7 , x[1] , " " * (22 - len(x[1])) ,x[2])
                elif(x==2):
                    y=int(input("Enter how many products you want to delete : "))
                    for i in range(y):
                        pid=input("Enter id of the product you want to delete : ")
                        cur=database.cursor(buffered=True)
                        q="SELECT product_id from cart_items where customer_id=%s"
                        cur.execute(q,[custid])
                        if not cur.fetchall():
                            print("No product found")
                        else:
                            cur=database.cursor(buffered=True)
                            q="SELECT quantity from cart_items where customer_id=%s and product_id=%s"
                            cur.execute(q,[custid,pid])
                            qty=0
                            for x in cur:
                                qty=x[0]
                            cur=database.cursor(buffered=True)
                            q="DELETE FROM cart_items where product_id=%s and customer_id=%s"
                            cur.execute(q,[pid,custid])
                            database.commit()
                            cur=database.cursor(buffered=True)
                            q="UPDATE cart SET no_of_items=no_of_items-%s where customer_id=%s"
                            cur.execute(q,[qty,custid])
                            database.commit()
                            print("Product removed successfully")
                            cur=database.cursor(buffered=True)
                            qry="UPDATE product SET Quantity=Quantity+%s where Product_ID=%s"
                            cur.execute(qry,[qty,pid])
                            database.commit()
                else:
                    break
            elif(inp==3):
                cur=database.cursor(buffered=True)
                q="SELECT * FROM orders where Customer_ID=%s"
                cur.execute(q,[custid])
                if not cur.fetchall():
                    print("No order found")
                    break
                cur=database.cursor(buffered=True)
                q="SELECT * FROM orders where Customer_ID=%s"
                cur.execute(q,[custid])
                for x in cur:
                    print("Order id            : ",x[0])
                    print("Address             : ",x[2])
                    print("Date                : ",x[3])
                    print("Time                : ",x[4])
                    print("Mode of payment     : ",x[5])
                    print("Discount            : ",x[6])
                    print("Amount              : ",x[7])
                    
            elif(inp==4):
                cur = database.cursor(buffered=True)
                q = "SELECT order_ID from orders"
                cur.execute(q)
                if not cur.fetchall():
                    newid = "O001"
                else:
                    cur = database.cursor(buffered=True)
                    q = "SELECT order_ID from orders ORDER BY order_ID DESC limit 1"
                    cur.execute(q)
                    for x in cur:
                        id = x[0]
                        sno = str(int(id[1:]) + 1)
                        newid = id[0] + "0" * (3 - len(sno)) + sno
                cur = database.cursor(buffered=True)
                q = "SELECT Address from customer where Customer_ID = %s"
                cur.execute(q , [custid])
                for x in cur:
                    add = x[0]
                cur = database.cursor(buffered=True)
                q = "SELECT Address from customer where Customer_ID = %s"
                mop = input("Enter mode of payment : ")
                cur = database.cursor(buffered=True)
                q = "SELECT Customer_type from customer where Customer_ID = %s"
                cur.execute(q , [custid])
                for x in cur:
                    type = x[0]
                type = type[0]
                if(type == "Normal"):
                    discount = 10
                else:
                    discount = 15
                cur=database.cursor(buffered=True)
                qry = ("INSERT into orders values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cur.execute(qry , [newid , 'Pending' , add , datetime.today() , datetime.now().strftime("%H:%M:%S") , mop , discount , 0 , custid , 'NULL'])
                database.commit()
                cur=database.cursor(buffered=True)
                qry = ('''select sum(cart_items.quantity * product.Price) from cart_items, product, orders where cart_items.customer_id = %s and 
                       orders.Customer_ID = %s and cart_items.product_id = product.Product_ID''')
                cur.execute(qry , [custid , custid])
                for x in cur:
                    amount = x[0]
                cur=database.cursor(buffered=True)
                qry = ("UPDATE orders set Amount = %s")
                cur.execute(qry , [amount])
                database.commit()
                cur = database.cursor(buffered=True)
                del_id = np.random.randint(100) + 1
                id = "D" + "0" * (3 - len(str(del_id))) + str(del_id)
                qry = ("UPDATE orders set Delivery_partner_ID = %s")
                cur.execute(qry , [id])
                database.commit()
            else:
                break
    else:
        break
 
database.close()