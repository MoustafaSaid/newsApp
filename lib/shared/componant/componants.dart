import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapplication/modules/webview/webview_screen.dart';

Widget buildAricleItem(var article,context,)=> InkWell(
  onTap: (){
    navigteTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(10.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                    child: Text('${article['title']}',style:Theme.of(context).textTheme.bodyText1,

                      maxLines: 3,overflow: TextOverflow.ellipsis,)),

                Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey,),),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget MyDivider ()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 10.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget ArticleBuilder(list,context,{isSearch=false})=>list.length>0? ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => buildAricleItem(list[index],context),
  separatorBuilder: (context, index) => MyDivider(),
  itemCount: list.length,):isSearch ? Container():Center(child: CircularProgressIndicator(),);




Widget defultButton({
  double? width = double.infinity,
  background = Colors.blue,
  double? radius = 10.0,
  bool isUpperCase = true,
  @required function,
  @required String? text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: background,
      ),
      width: width,
      //height:40.0 ,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '${isUpperCase ? text!.toUpperCase() : text}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  onSubmit,
  onChange,
  @required validate,
  @required String? label,
  @required IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  suffixPressed,
  onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        // hintText: "Email Address",
        labelText: label,
        //border: InputBorder.none,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
      ),
    );
Widget buildTaskItem(Map model,context)=> Dismissible(
  child:Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}'
          ),
        ),
        SizedBox(
          width:20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          width:20.0,
        ),
        IconButton(
          onPressed: (){
            // AppCubit.get(context).updatedata(status: 'done', id: model['id'],);
          },
          icon: Icon(
            Icons.check_box,
            color:Colors.green,
          ),
        ),
        IconButton(
          onPressed: (){
            // AppCubit.get(context).updatedata(status: 'archive', id: model['id'],);

          },
          icon: Icon(
            Icons.archive,
            color:Colors.black45,
          ),
        ),

      ],
    ),
  ),
  key: Key(model['id'].toString()),
  onDismissed: (direction){
    // AppCubit.get(context).deletetedata(id: model['id'],);
  },
);


Widget tasksBuilder({
  @required  List<Map>? tasks,
})=> tasks!.length>0 ? ListView.separated(
  itemBuilder: (context, index) => buildTaskItem(tasks[index],context),
  separatorBuilder: (context, index) => Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
    ),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  ),
  itemCount:tasks.length, ):Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.green,
        ),
        Text(
          'No Tasks Yet Add some '
          ,style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        )
      ],
    )
);
void navigteTo(context,widget)=>Navigator.push(context,MaterialPageRoute(
  builder:(context)=>widget,
),);