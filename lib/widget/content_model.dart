class UnbordingContent{
  String image;
  String title;
  String description;
  UnbordingContent({required this.image,required this.title,required this.description});
} 
List<UnbordingContent> Contents =[
  UnbordingContent(
    image:'images/screen1.png' , 
    title: 'Select From Our\n Best Menu', 
    description: "Pick Your Food From Our Meanu \n     More Than 30 Items"),
    UnbordingContent(image: 'images/screen2.png', title: 'Easy and online payment', description: 'you can pay cash on delivery and\n    card payment is avalible'),
    UnbordingContent(image: 'images/screen3.png', title: 'Quick Delivery at Your DoorStep', description: 'Delivery Your Food at Your\n DoorStep'),
];