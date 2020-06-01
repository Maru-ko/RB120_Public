=begin
2,735
There are just some things you can't do on television. In this case, you've just come back from having a "delicious" Barth burger and you're set to give an interview. 
The Barth burger has made you queezy, and you've forgotten some of the import rules of the "You Can't Do That on Television" set.

If you say any of the following words a large bucket of "water" will be dumped on you: "water", "wet", "wash" This is true for any form of those words, like "washing", 
"watered", etc.

If you say any of the following phrases you will be doused in "slime": "I don't know", "slime"

If you say both in one sentence, a combination of water and slime, "sludge", will be dumped on you.

Write a function, bucketOf(str), that takes a string and determines what will be dumped on your head. If you haven't said anything you shouldn't have, the bucket should 
be filled with "air". The words should be tested regardless of case.

=end


def bucket_of(said)
  #str = said.downcase
  return 'sludge' if said.match?(/\bwater\b/) && said.match?(/\bslime\b/)
  return 'slime' if said.match?(/\bslime\b|\bi don't know\b/i)
  return "water" if said.match?(/\bwater\b|\bwet\b|\bwash\b/i)
  'air'
end




p bucket_of("What is that, WATER?!?") #-> "water"
p bucket_of("I don't know if I'm doing this right.") #-> "slime"
p bucket_of("You won't get me!") #-> "air"
p bucket_of('water')#, 'water');
p bucket_of('slime')#, 'slime');
p bucket_of("Will I get wet? I don't know.")#, 'sludge');
p bucket_of('This should be safe.')#, 'air');