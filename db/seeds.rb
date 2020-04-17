

House.create(name: "Buchanans")
House.create(name: "Archibald")
mcduke = House.create(name: "McDuke")

billy = User.create(name: "Billy", email: "billy@aol.com", password: "greenbeans", house: mcduke)
claire = User.create(name: "Claire",  email: "claire@gmail.com", password: "fishsticks", house: mcduke)
ashley = User.create(name: "Ashley",  email: "ashley@yahoo.com", password: "milkmaid", house: mcduke)

Complaint.create(content: "watches tv too loud", user: billy, housemate: ashley)
Complaint.create(content: "doesn't wash the dishes", user: ashley, housemate: billy)
Complaint.create(content: "leaves clothes all over the place", user: claire, housemate: ashley)
Complaint.create(content: "leaves hair in the drain. Like how is there so much hair.", user: billy, housemate: claire)
Complaint.create(content: "Has bad taste in music", user: claire, housemate: billy)
Complaint.create(content: "eats like a pre-historic animal", user: ashley, housemate: billy)
Complaint.create(content: "keeps stealing my underwear", user: billy, housemate: claire)
Complaint.create(content: "Doesn't lock the door", user: ashley, housemate: claire)
Complaint.create(content: "Hiding a ferret somewhere in the closet", user: claire, housemate: ashley)
Complaint.create(content: "stop holding seances in the kitchen", user: ashley, housemate: billy)



