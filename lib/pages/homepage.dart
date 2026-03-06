import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_go/model/category_model.dart';
import 'package:pharma_go/model/for_you_model.dart';
 
class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
List<CategoryModel> categories=[];
List<ForYouModel> forYou = [];
void _getCategories(){

  categories = CategoryModel.getCategories();

}

void _getForYou(){

  forYou = ForYouModel.getForYou();
}



  @override
  Widget build(BuildContext context) {
  _getCategories();
  _getForYou();
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
       // title : Text('pharmaGo',
       // style: TextStyle(
        //  fontSize:30,
        //  fontWeight: FontWeight.bold,
          //color: Color(0xFF364fab),

        //),

      //  ),

        title: Text.rich(
        TextSpan(
            children: [

              TextSpan(text: 'pharma',
              style : TextStyle(
                color: Color(0xff364fab),
                fontWeight: FontWeight.bold,
                  fontSize: 30,
              ),

              ),
              TextSpan(text:'Go',
              style: TextStyle(
                color: Color(0xffff751f),
                fontWeight: FontWeight.bold,
                fontSize: 30,

              ),

              )


            ]),

        ),




        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
       leading:
       TextButton(
         onPressed: (){


         },
         child: Container(
           margin: EdgeInsets.all(5),
           alignment: Alignment.center,
           child:SvgPicture.asset('assets/icons/arrownormal.svg',
            height:30,
             width: 30,
           ),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius:BorderRadius.circular(10),

           ),

         ),
       ),



      ),

 //backgroundColor: Colors.white,

      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:EdgeInsets.only(top:20, left:15,right:15),
          decoration: BoxDecoration(
            boxShadow:[ BoxShadow(
              color:Color(0xFFC5CAE9FF).withOpacity(0.25) ,
              blurRadius: 40,
              spreadRadius: 0.10 ,

            )],

          ),
          child: TextField(
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.indigo[50],
            //fillColor: Colors.white,
              hintText: 'Search  medicines',
              hintStyle:TextStyle (

                fontSize: 18,

              ),

              contentPadding: EdgeInsets.all(15),
              prefixIcon:Icon(
                Icons.search,
              ),
              suffixIcon: Container(
                width:100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.end ,
                    children: [
                      VerticalDivider(
                        color: Colors.deepPurple[600],
                        indent: 10,
                        endIndent: 10,
                        thickness:2 ,
                      ),

                      TextButton(
                        onPressed: (){},

                        child: Icon(
                          Icons.qr_code_scanner_rounded,
                          size:40,

                        ),
                      ),
                     // SizedBox(width:10),
                    ],
                  ),
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),

          ),

        ),
        SizedBox(height:30),
        Column(
crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Text('Category',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff364fab),

                ),

              ),
            ),
            SizedBox(height:20),
            Container(
              height: 120,
             // color: Colors.indigo,
            //color : Colors.white,
            child: ListView.separated(
            itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left:15,
                  right:15,

                ),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder:(context,index){
                  return Container(

                     height: 50,
                      width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(.10),
                      borderRadius: BorderRadius.circular(16),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                         height: 65,
                          width:65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                       child: SvgPicture.asset(categories[index].icon),

                        ),
                        Text(

                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,

                          ),


                        ),



                      ],

                    ),



                  );
                },


            ),



            ),


          ],
        ),

        SizedBox(height:15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Text('Recomendation\n'
                'For you',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xff364fab),
                  fontWeight: FontWeight.w500,

                ),

              ),
            ),
            SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.only(
                left:20,
                right: 20,

              ),
              child: Container(
                height:320,
                //color: Colors.indigo[50],
                //color:Colors.white,
                child: ListView.separated(itemBuilder: (context,index){

                  return Container(

                    width:210 ,
                    decoration: BoxDecoration(
                     color: forYou[index].boxColor.withOpacity(0.10),
                     borderRadius: BorderRadius.circular(16),

                    ),

                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       (forYou[index].image),
                        Padding(
                          padding: const EdgeInsets.only(left:10,right:10),
                          child: Text(
                           forYou[index].product,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right:8.0),
                      child: Text(
                      forYou[index].text,

                      ),

                    ),
                  SizedBox(height:5),
                  Container(


                 height: 30,
                    width: 100,
                decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(16),

                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to cart',
                        style: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.w600,

                        ),



                      ),
                    ],
                  ),
                   
                  ),



                      ],

                    ),

                  );

                },
                    separatorBuilder: (context,index)=>SizedBox(width:25),
                    scrollDirection: Axis.horizontal,
                    itemCount: forYou.length),




              ),
            ),




          ],
        ),
      ],


      ),

floatingActionButton: FloatingActionButton(onPressed: (){},

    backgroundColor: Colors.pink[400],
    child: Icon(Icons.shopping_cart,
    color: Colors.white,

    )

),


    );
  }
}

