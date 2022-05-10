// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//linear search

contract lec24{
    
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea","North Korea","USA","China","Japan"]; 
    
    //Taiwan
    function linearSearch(string memory _search) public view returns(uint256,string memory){
        
        for(uint256 i=0; i<countryList.length; i++){
            //string은 solidity내에서 비교 불가능
            //그러므로 string을 bytes화 시키고 keccak256으로 해쉬화 시켜 비교해준다.
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
                return (i,countryList[i]);
            }
        }
        
        return(0,"Nothing");
    } 

}