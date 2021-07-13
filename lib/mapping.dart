class Datamodel {
  String image, auther, productname;
  bool isselected;
  int srialno, productprice;
  Datamodel(
    this.isselected,
    this.srialno,
    this.image,
    this.productname,
    this.auther,
    this.productprice,
  );
}

// ignore: deprecated_member_use
List cartlist = [];

List<Datamodel> itemdetail = [
  Datamodel(
    false,
    1,
    "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
    "Hacking - The Art Of Exploitation",
    "Jon ErickSon-7th edition",
    700,
  ),
  Datamodel(
    false,
    2,
    "https://m.media-amazon.com/images/I/51p0f9Q6zEL.jpg",
    "Hacking wit Python",
    "unknown-3th edition",
    1100,
  ),
  Datamodel(
    false,
    3,
    "https://m.media-amazon.com/images/I/51sjfmeSEyL.jpg",
    "Hacking Tools For Computer",
    "unknown-3th edition",
    800,
  ),
  Datamodel(
    false,
    4,
    "https://i.pinimg.com/originals/e0/fb/5a/e0fb5a642da337fa69aceca302bd3418.jpg",
    "Grey Hat C#",
    "unknown-7th edition",
    600,
  ),
  Datamodel(
    false,
    5,
    "https://www.fita.in/wp-content/themes/zeft/images/The-Web-Application-Hackers-Handbook-Finding-and-exploiting-security-flaws.jpg",
    "The Web Application-Hacking Handbook",
    "unknown-2th edition",
    1300,
  ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 6,
  //   image: "https://m.media-amazon.com/images/I/41rQhmMAA7L.jpg",
  //   productname: "Hacking For Begainner - The Art Of Black World",
  //   auther: "Karnel ErickSon-1th edition",
  //   productprice: "Rs. 2000",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 7,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 7,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking world - The Art Of Exploitation",
  //   auther: "Jon ErickSon-6th edition",
  //   productprice: "Rs. 500",
  // ),
  // Datamodel(
  //   srialno: 8,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic12.jpg",
  //   productname: "Hackingn",
  //   auther: "Jon ErickSon-1st edition",
  //   productprice: "Rs. 300",
  //   isselected: false,
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 9,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 10,
  //   image:
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTbXNfHi7CvY9158kkinhMLZN_LZ6cxI8PUg&usqp=CAU",
  //   productname: "Black Hat Python",
  //   auther: "Jon -4th edition",
  //   productprice: "Rs. 1100",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 11,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-1th edition",
  //   productprice: "Rs. 200",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 12,
  //   image:
  //       "https://i.pinimg.com/236x/f8/40/e5/f840e5b7d1248da9396d5d3e258a30f0.jpg",
  //   productname: "Hacking - The pratical world",
  //   auther: "Jahid-3th edition",
  //   productprice: "Free",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 13,
  //   image: "https://m.media-amazon.com/images/I/510HZq1xZEL.jpg",
  //   productname: "Hacking with kali linux",
  //   auther: "Stephen F-1st edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 14,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-11th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 15,
  //   image:
  //       "https://4.bp.blogspot.com/-dvtERR9Qa4M/UMN-Q6yBfhI/AAAAAAAAOxs/dgQ-HFNiSDc/s640/Hacking+S3crets.jpg",
  //   productname: "Hacking Secret",
  //   auther: "Jon ErickSon-1th edition",
  //   productprice: "Rs. 750",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 16,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-9th edition",
  //   productprice: "Rs. 400",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 17,
  //   image:
  //       "https://4.bp.blogspot.com/-dvtERR9Qa4M/UMN-Q6yBfhI/AAAAAAAAOxs/dgQ-HFNiSDc/s640/Hacking+S3crets.jpg",
  //   productname: "Hacking- Password Crakking- The Art Of Exploitation",
  //   auther: "Jon ErickSon-4th edition",
  //   productprice: "Rs. 190",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 18,
  //   image:
  //       "https://4.bp.blogspot.com/-dvtERR9Qa4M/UMN-Q6yBfhI/AAAAAAAAOxs/dgQ-HFNiSDc/s640/Hacking+S3crets.jpg",
  //   productname: "Hacking- Password Crakking",
  //   auther: "Jon ErickSon-1th edition",
  //   productprice: "Rs. 400",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 19,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-3rd edition",
  //   productprice: "Rs. 600",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 20,
  //   image:
  //       "https://4.bp.blogspot.com/-dvtERR9Qa4M/UMN-Q6yBfhI/AAAAAAAAOxs/dgQ-HFNiSDc/s640/Hacking+S3crets.jpg",
  //   productname: "Hacking- Password Crakking- The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 21,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 22,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 23,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 24,
  //   image: "https://www.guru99.com/images/2/060520_1048_16BESTEthic1.jpg",
  //   productname: "Hacking - The Art Of Exploitation",
  //   auther: "Jon ErickSon-7th edition",
  //   productprice: "Rs. 700",
  // ),
  // Datamodel(
  //   isselected: false,
  //   srialno: 25,
  //   image:
  //       "https://assets.infosecurity-magazine.com/content/float/18820179-bf2d-4096-9ccc-a5c2285ddb70.jpg",
  //   productname: "Grey Hats -C++",
  //   auther: "Brando-1th edition",
  //   productprice: "Rs. 200",
  // ),
];
