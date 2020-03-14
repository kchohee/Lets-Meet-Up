users_list = [
    ["Bob", "bob@gmail.com", "23reu"],
    ["Hongki","ft@island.com", "rhagfsdr"],
    ["Jessice","jauf@yahoo.com","dsfg"],
    ["Amber","kehai@hotmail.com","fsdg"],
    ["Roger","bewrany@aol.com","fdsg"],
    ["Jaebum","jpark@highergang.com","rgsafsrg"],
    ["Alex","ewtkfho@icloud.com","fsgs"],
    ["Jamal","ewtk@gmail.com","dfg"],
    ["Dpr","dpr@coming2ulive.com" "rwgdar"],
    ["Nelson","wtfwr@hotmail.com","rgfs"],
    ["Matt","rwtgfwret@msn.com","gfsg"],
    ["Leon","leonjkkim0401@gmail.com","jiyongie"],
    ["G-dragon","gd@bigbang.com", "rwgrasdg"],
    ["Paul","paulm@gmail.com","jiyongie"],
    ["Janice","rgfobiwebriu@aol.com","rtgfs"],
    ["Will","ban@yas.com","ban"],
    ["Dai","ibgrsfvciub@hotmail.com","egrf"],
    ["Soohyun", "sohyun@naver.com", "regag"]
]
@all_users = []
users_list.each do |name, email, password|
   @all_users << User.create(name: name, email: email, password: password)
end

groups_list = [
    ["Parents Forum", "We give each other advice on issues that we might be having with our children"],
    ["Coders-Around the World","We help each other strengthen our coding abilities"],
    ["We Hate Cats","I guess its not that we hate it... we are just allergic and would rather stay away. Share your feline horror stories. We all know that they are really out to get us.... one day they will take over the world if we aren't careful"],
    ["Weeb Life","Are you about that weeb life? Need some cosplay ideas? Maybe you are stuck on how to make something pratical for wearing... WE ARE HERE TO HELP!"],
    ["We Aren't Crazy...","The goverment is hiding secrets!!! From UFO's to the Bermuda triangle.. they have their dirty fingers in EVERYTHING!!! Join us in the fight against the unknown. You will have to provide your own tin-foil hat. No lizard people allowed! "],
    ["Foodies","We are dedicated to sharing recipes, the go to food spots, and advice to improve your instagram foodies photos!"],
    ["Memes","Do you know dey way?"]
]
@all_groups = []
groups_list.each do |name, bio|
    @all_groups << Group.create(name: name, bio: bio)
end

@all_users.each do |user|
   @group = @all_groups[rand 7]
   user.group = @group
   user.save
end

users_post = ["I love this group!",
    "Have you heard what is going on with the virus?",
    "I wish I could meet up with you all in person.",
    "I am new to the group. I can't wait to get to know you all!",
    "What's the weather like in your area guys?",
    "I have no idea what to put to be honest so... supp guys?",
    "I really could go for a sandwich right about now!",
    "Weather has been CRAZY these last few days.",
    "I think I might be in the wrong group.... but I guess I will stay.",
    "Is anyone working on anything big they would like to share?",
    "Hey guys, my numnber is 1-800-573-5793",
    "Do you guys think there is life on Mars?... off topic but... yea?",
    "Lets-meet would be cooler if it was a blue background",
    "HEY!",
    "Wassup!",
    "What's good?",
    "I am really running out of things to talk about with you guys.",
    "I am thinking about leaving this group.. you guys are cool just... its me... not you.",
    "I really want some ice cream right meow",
    "What's your guys favorite movie?",
    "Its kinda crazy how we are never on the same topic... why dont you guys ever reply to each other... you guys suckkk XD",
    "My favorite color is red... whats yours?",
    "I am currently attending school at Flatiron so.. I might get busy and not have a lot of time to be active here soon",
    "Dude have you see the photos of people buying all the tp? What is up with that?!",
    "There were tornadoes here last night... I just thought you should know.",
    "Lets take a trip to Hawaii",
    "I don't know about you guys but the new sonic movie was LITTT",
    "This groups sucks... you guys suck..",
    "TROLLOLOLOLOLOLOLOLOLOLOLOLOLOL",
    "Dope... I am in a group now!",
    "SUHHHHHHHH UP I am new here... what it do lol",
    "Anyone free for a video cam chat.. having a hard day and would love a pick me up",
    "I really don't know who to talk to about this but... there's this weird mole on my back and... its ugly man",
    "Do any of you watch Westworld? Show is legit the best!",
    "Have you seen devs? Its pretty cool man!",
    "I wish I could take a break and just go on a vacay man",
    "I hear that Trump is going to get impeached... whatcha think about that?",
    "Drugs are bad.... mmmmmmkkkkaaayyy",
    "Theres no I in team... but you can make a me... JUST SAYING",
    "What's the weirdest thing you guys have ever done?",
    "Do you guys wanna meet up in RL?",
    "ASL?"
]
@all_post = []
users_post.each do |content|
    @all_post << Post.create(content: content)
end
def rand_in_range(from, to)
    rand * (to - from) + from
end
def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
end

@all_post.each do |post|
    @user = @all_users[rand 20]
    post.user = @user
    post.published = rand_time((rand 20).days.ago)
    post.save
end