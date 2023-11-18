// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.6.0;
pragma experimental ABIEncoderV2;

contract digiLocker {
    //structures and other variable declrn
    
    struct Document{
        bytes32 docid; //doc id
        string docName;
        string timestamp; //
        bytes32 docHash; //doc hash
    }
    struct UserDetails{
        string firstName;
        string lastName;
        string email;
        string contact;
    }
    
    struct User{
        userType utype;
        bool valid;
        UserDetails details;
        address _useraddress;
        //bytes32 accessKey; // user master key Hash
        string pubKey; // Public key of user
    }
    uint usercount = 0;
    address[] _glbluseraddress;
    ///////////////////////-- enums here -- ///////////////////////////////////
    enum userType { Issuer, Resident, Requester, Admin }
    enum Permission {READ, MODIFY}
    
    
    ///////////////////////-- events here -- ///////////////////////////////////
    event registeredUserEvent(string _email,userType utype,address indexed _useraddress);
    event uploadDocumentEvent(bytes32 indexed docid, bytes32 docHash, address indexed user_addr);
    event sharedDocumentEvent(bytes32 indexed docid, address indexed docOwner,address indexed sharedWith, uint8 permission);
    event verifyDocumentEvent(bytes32 indexed docid, address indexed docOwner, address indexed sharedWith);
    
    
    
    ///////////////////////-- mapping here -- ///////////////////////////////////
    mapping(address => User) registerUsers;
    mapping (address => Document[])  ownerDocuments;
    mapping (string => address)  emailAddressMapping;
    

    ///////////////////////-- functions here -- ///////////////////////////////////
   

 function isalreadyRegisteredUser() public view returns(bool){
        if(registerUsers[msg.sender]._useraddress == 0x0000000000000000000000000000000000000000){
            return false;
        }
        else{
            return true;
        }
    }
 
    
    //register user
    function registerUser(string memory _firstName,
            string memory _lastName,
            string memory _email, uint8 _utype,
            string memory _contact, 
            string memory pubKey) public returns(bool) {
            UserDetails memory d = UserDetails(_firstName,_lastName, _email, _contact);
                User memory newuser = User( userType(_utype), true, d, msg.sender,pubKey);
                
                emailAddressMapping[_email] = msg.sender;
                
                registerUsers[msg.sender] = newuser;
                emit registeredUserEvent(_email, userType(_utype), msg.sender);
                _glbluseraddress.push(msg.sender);
                usercount++;
                return true;
    }

    function uploadDocument(string memory docName, bytes32 docId, bytes32 docHash, string memory timestamp) public returns(bool){
        Document memory d = Document(docId, docName, timestamp, docHash);
        ownerDocuments[msg.sender].push(d);
        emit uploadDocumentEvent(docId, docHash, msg.sender);
        return true;
    }
    function shareDocumentwithUser(bytes32 docid, uint8 permission,address _requester) public{
        //  address  _owner, = msg.sender
        emit sharedDocumentEvent(docid, msg.sender, _requester, permission);
    }

    function verifyUserDocument(bytes32 docid, address  _owner) public{
        // , address _requester = msg.sender
        emit verifyDocumentEvent(docid,_owner,msg.sender);
    }
    
}

