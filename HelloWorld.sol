pragma solidity 0.5.12;

contract HelloWorld{
    // STATE VARIABLES
    string public message = "Hello World!";
    uint public number = 123;
    bool public isHappy = true;
    address public contractCreator = 0x52712037BE5A0f14CebbE371881F9882Baf38AaB;

    // can fix the value of the size of the array.
    uint[] public numbers = [1, 2, 3];
    string[] public messages = ["Hello", " World", "!"];

    struct Person {
        uint id;
        string name;
        uint age;
        uint height;
        bool senior;
        address walletAdress;
    }

    Person[] public people;

    mapping(address => Person) private someone;


    // FUNCTIONS
    function createPerson(string memory name, uint age, uint height) public {
        Person memory newPerson;
        newPerson.id = people.length;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;

        if(age > 65){
            newPerson.senior= true;
        }
        else{
            newPerson.senior = false;
        }

        people.push(newPerson);

        // or just people.push(Person(people.lenght, name, age, height));
    }

    function createSomeone(string memory name, uint age, uint height ) public {
        address creator = msg.sender;

        Person memory newPerson;
        newPerson.id = people.length;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;

        if(age > 65){
            newPerson.senior= true;
        }
        else{
            newPerson.senior = false;
        }

        someone[creator] = newPerson;

    }

    function getSomeone() public view returns(string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (someone[creator].name, someone[creator].age, someone[creator].height, someone[creator].senior);
    }


    function getMessage() public view returns(string memory){
        return message;
    }

    function setMessage(string memory newMessage) public{
        message = newMessage;
    }

    function getNumber(uint index) public view returns(uint){
        return numbers[index];
    }

    function setNumber(uint newNumber, uint index) public {
        numbers[index] = newNumber;
    }

    function addNumber(uint newNumber) public {
        numbers.push(newNumber);
    }
}
