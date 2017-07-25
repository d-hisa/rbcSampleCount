/**
 * swift
 */

/*
 * anntotations
 */
@IBOutlet
@IBAction


/*
 * VALIABLE definition
 * var VALUE_NAME: INIT_TYPE = INIT_VALUE
 */
//ex.
var hoge: Int = 0
var foo: UILabel!

/*
 * for statement
 * for VALIABLE in ITEMS{}
 * ITEMS: ex. 0..<100
 *  - 0..<100 is continueing 0 to 99
 *  - 0...100 is continueing 0 to 100
 */

// ex.
for i in 0..<100 {
    // process...
}
// not use "i"
for _ in 0..<100 {}

/*
 * if statement
 * if CONDITION{
 * }else if CONDITIØN{
 * }else{}
 */

 /*
  * switch statement
  * switch VALIABLE
  * case VALUE:
  * default:
  */

/*
 * Array
 * var array: [TYPE] = []
 * array.append("hoge")
 */

/*
 * function
 */
// Statements
func FUNCTION_NAME (VALIABLE_NAME: ARGUMENT_TYPE) -> RETURN_VALUE_TYPE {

}

func hoge(variable: Int) -> String {
    var returnValue
    returnValue = (String)variable
    return returnValue
}

/*Randmize*/
let rand: IntU32 = arc4random_uniform(MAX_VALUE)

/*
 * ViewControllerをDismissする
 */
@IBAction func backView(){
    self.dismiss(animated: true, completion: nil)
    // animated:アニメーションの有無
    // completion:処理完了後に実行すること
}
@IBAction func nextView(){
    self.performSegue(withIdentifier: "SegueにつけたID", sender: nil)
    //senderはほとんどの場合nilらしい
}
// UserDefaultds
let ud = UserDefaults.standard
ud.set(number, forKey: "number")
ud.synchronize()

number_2 = ud.integer(forKey: "number")






ViewController first/second/third

first -> second
first -> third





@IBOutlet var titleLbael: UILabel!
@IBOutlet var countLabel: UILbael!

countLabel.text = String(123)




if nanika == 10 && 20
if (nanika == 10) && (nanika == 20)



var dishArray: array[String] = [aa,bb,cc,ddd]
func dish(){
    var number: Int = arc4random_uniform(4)

    var number: Int = "123"

    var number = Int(arc4random_uniform(4))
    var number = Int("123")

    label.text = dishArray[number]

    switch number  {
    case 1:
        label/text = "カレー"
        photoImage.image = UIImage(named: "carray")
    case 2:
        photoImage.image = UIImage(namde: "gohan")
    }





    case



}





var array: [String] = []
var array = [String]()

var moji: String = ""
var moji: [String] = ""
