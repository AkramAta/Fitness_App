List<Map> ExercisesDatabase = [
  {
    "beginner": {
      "biceps": [
        {
          "name": "Incline Hammer Curls",
          "equipment": "dumbbell",
          "instructions": "Seat yourself on an incline bench and curl the dumbbells with a neutral grip.",
          "image": "assets/Image/arms.png"
        },
        {
          "name": "Dumbbell Curl",
          "equipment": "dumbbell",
          "instructions": "Stand with dumbbells in each hand, curling them toward your shoulders.",
          "image":"assets/Image/arms.png"
        },
        {
          "name": "Concentration Curls",
          "equipment": "dumbbell",
          "instructions": "Sit on a bench, rest your elbow on your thigh, and curl a dumbbell.",
          "image": "assets/Image/arms.png"
        },
        {
          "name": "Resistance Band Bicep Curl",
          "equipment": "resistance band",
          "instructions": "Stand on the band, hold the handles, and perform a bicep curl.",
          "image": "assets/Image/arms.png"
        },
        {
          "name": "Cable Bicep Curl",
          "equipment": "cable machine",
          "instructions": "Use a cable machine with a straight bar attachment and perform curls.",
          "image": "assets/Image/arms.png"
        },
        {
          "name": "EZ Bar Curl",
          "equipment": "EZ bar",
          "instructions": "Hold the EZ bar at a comfortable angle, curling it toward your shoulders.",
          "image": "assets/Image/arms.png"
        }
      ],
      "chest": [
        {
          "name": "Push-ups",
          "equipment": "none",
          "instructions": "Perform regular push-ups with your hands shoulder-width apart.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Chest Press (Machine)",
          "equipment": "chest press machine",
          "instructions": "Sit in the machine and press the handles forward.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Kneeling Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups from a kneeling position for less intensity.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Incline Push-ups",
          "equipment": "none",
          "instructions": "Place your hands on an elevated surface and perform push-ups.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Dumbbell Chest Fly",
          "equipment": "dumbbell",
          "instructions": "Lie on a flat bench and perform a fly motion with dumbbells.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Dumbbell Chest Press",
          "equipment": "dumbbell",
          "instructions": "Lie flat on a bench and press dumbbells straight up.",
          "image": "assets/Image/chest_workout.jpeg"
        }
      ],
      "legs": [
        {
          "name": "Bodyweight Squats",
          "equipment": "none",
          "instructions": "Perform regular squats without weight.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Lunges",
          "equipment": "none",
          "instructions": "Step forward and lower your body until both knees are at 90 degrees.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Step-ups",
          "equipment": "bench or step",
          "instructions": "Step onto a bench or platform with one foot, then step down.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Glute Bridge",
          "equipment": "none",
          "instructions": "Lie on your back with knees bent, lift your hips toward the ceiling.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Wall Sits",
          "equipment": "none",
          "instructions": "Lean against a wall and hold a sitting position.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Calf Raises",
          "equipment": "none",
          "instructions": "Stand and lift your heels off the ground, then lower back down.",
          "image": "assets/Image/leg_workout.jpeg"
        }
      ],
      "back": [
        {
          "name": "Lat Pulldown",
          "equipment": "lat pulldown machine",
          "instructions": "Sit at the machine and pull the bar down to your chest.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Seated Cable Row",
          "equipment": "cable machine",
          "instructions": "Sit and pull the cable toward your midsection.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Dumbbell Row",
          "equipment": "dumbbell",
          "instructions": "Place one knee on a bench and row a dumbbell toward your torso.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Resistance Band Row",
          "equipment": "resistance band",
          "instructions": "Stand or sit with the band anchored and row the handles toward your body.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Superman",
          "equipment": "none",
          "instructions": "Lie face down and lift your arms and legs simultaneously, holding at the top.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Chest Supported Dumbbell Row",
          "equipment": "dumbbells, bench",
          "instructions": "Lie chest-down on an incline bench and perform rows.",
          "image": "assets/Image/back_workout.jpeg"
        }
      ],
      "core": [
        {
          "name": "Plank",
          "equipment": "none",
          "instructions": "Hold a plank position on your forearms with your body in a straight line.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Bicycle Crunches",
          "equipment": "none",
          "instructions": "Lie on your back and alternate bringing your knees to your opposite elbows.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Mountain Climbers",
          "equipment": "none",
          "instructions": "Start in a plank and alternate driving your knees toward your chest.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Leg Raises",
          "equipment": "none",
          "instructions": "Lie on your back and lift your legs straight up and lower them slowly.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Dead Bug",
          "equipment": "none",
          "instructions": "Lie on your back with arms and legs in the air, lowering one leg and opposite arm.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Russian Twists",
          "equipment": "none",
          "instructions": "Sit on the floor and twist your torso while balancing on your butt.",
          "image": "assets/Image/core_workout.jpeg"
        }
      ],
      "triceps": [
        {
          "name": "Tricep Dips (Bench)",
          "equipment": "bench",
          "instructions": "Sit on a bench and lower your body by bending your elbows behind you.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Overhead Dumbbell Extension",
          "equipment": "dumbbell",
          "instructions": "Hold a dumbbell overhead and lower it behind your head, extending your arms.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Close-Grip Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups with your hands closer together to target the triceps.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Kickbacks",
          "equipment": "dumbbell",
          "instructions": "Bend at the waist and extend a dumbbell backward to work the triceps.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Resistance Band Pushdown",
          "equipment": "resistance band",
          "instructions": "Attach the band above you and push it down to your thighs.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Skull Crushers",
          "equipment": "EZ bar",
          "instructions": "Lie on a bench and lower an EZ bar toward your forehead, then press back up.",
          "image": "assets/Image/triceps_workout.jpeg"
        }
      ],
      "push": [
        {
          "name": "Push-ups",
          "equipment": "none",
          "instructions": "Start in a plank position, lower your body to the ground, then push back up.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Kneeling Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups from your knees for less intensity.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Incline Push-ups",
          "equipment": "none",
          "instructions": "Place your hands on an elevated surface and perform push-ups.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Dumbbell Shoulder Press",
          "equipment": "dumbbells",
          "instructions": "Press dumbbells from shoulder height overhead.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Tricep Dips (Bench)",
          "equipment": "bench",
          "instructions": "Place your hands on a bench behind you and lower your body by bending your elbows.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Overhead Dumbbell Tricep Extension",
          "equipment": "dumbbell",
          "instructions": "Hold a dumbbell overhead and lower it behind your head, then extend your arms.",
          "image": "assets/Image/push_workout.jpeg"
        }
      ],
      "pull": [
        {
          "name": "Lat Pulldown",
          "equipment": "lat pulldown machine",
          "instructions": "Sit at the machine and pull the bar down to your chest.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Dumbbell Row",
          "equipment": "dumbbell",
          "instructions": "Place one knee on a bench and row a dumbbell toward your torso.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Resistance Band Row",
          "equipment": "resistance band",
          "instructions": "Stand with the band anchored and row the handles toward your torso.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Bicep Curl",
          "equipment": "dumbbells",
          "instructions": "Stand and curl dumbbells toward your shoulders, targeting the biceps.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Seated Cable Row",
          "equipment": "cable machine",
          "instructions": "Sit and pull the cable toward your chest, keeping your back straight.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Face Pull",
          "equipment": "cable machine",
          "instructions": "Pull the cable toward your face, keeping your elbows high to target rear delts and upper back.",
          "image": "assets/Image/pull_workout.jpeg"
        }
      ]
    },
    "intermediate": {
      "biceps": [
        {
          "name": "Barbell Curl",
          "equipment": "barbell",
          "instructions": "Stand upright, curl the barbell up while keeping your elbows steady.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Zottman Curl",
          "equipment": "dumbbell",
          "instructions": "Perform a regular curl on the way up and rotate your wrists to a reverse grip on the way down.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Incline Dumbbell Curl",
          "equipment": "dumbbell",
          "instructions": "Perform curls on an incline bench, lowering the dumbbells slowly.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Preacher Curl",
          "equipment": "barbell or dumbbell",
          "instructions": "Sit on a preacher bench and curl the weight up from a stretched position.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Cable Hammer Curl",
          "equipment": "cable machine",
          "instructions": "Use a rope attachment on a low pulley to perform hammer curls.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Wide-Grip Barbell Curl",
          "equipment": "barbell",
          "instructions": "Use a wide grip on the barbell to target the inner biceps.",
          "image": "assets/Image/biceps_workout.jpeg"
        }
      ],
      "chest": [
        {
          "name": "Incline Bench Press",
          "equipment": "barbell",
          "instructions": "Use an incline bench to press the barbell upward.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Decline Bench Press",
          "equipment": "barbell",
          "instructions": "Use a decline bench to press the barbell.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Cable Chest Fly",
          "equipment": "cable machine",
          "instructions": "Stand between two cable pulleys and bring your arms together in a fly motion.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Dumbbell Pullover",
          "equipment": "dumbbell",
          "instructions": "Lie on a bench, holding a dumbbell overhead, and bring it over your chest.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Dips (Chest-focused)",
          "equipment": "parallel bars",
          "instructions": "Perform dips with your torso leaning forward to target the chest.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Pec Deck Machine",
          "equipment": "machine",
          "instructions": "Sit in the pec deck machine and bring the handles together.",
          "image": "assets/Image/chest_workout.jpeg"
        }
      ],
      "legs": [
        {
          "name": "Goblet Squats",
          "equipment": "dumbbell",
          "instructions": "Hold a dumbbell close to your chest while performing squats.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Bulgarian Split Squat",
          "equipment": "dumbbell",
          "instructions": "Place one foot behind you on a bench and perform single-leg squats.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Leg Press",
          "equipment": "leg press machine",
          "instructions": "Sit in the leg press machine and push the platform upward.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Romanian Deadlift",
          "equipment": "barbell",
          "instructions": "Perform a deadlift with slight knee bends to focus on the hamstrings.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Lateral Lunges",
          "equipment": "none",
          "instructions": "Step to the side and lower your body into a lunge.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Box Jumps",
          "equipment": "box or platform",
          "instructions": "Jump onto a box or platform, then step down and repeat.",
          "image": "assets/Image/leg_workout.jpeg"
        }
      ],
      "back": [
        {
          "name": "T-Bar Row",
          "equipment": "T-bar machine",
          "instructions": "Use the T-bar row machine and pull the handle toward your chest.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Bent-Over Barbell Row",
          "equipment": "barbell",
          "instructions": "Bend at the waist and row the barbell to your lower chest.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Single Arm Cable Row",
          "equipment": "cable machine",
          "instructions": "Stand and pull the cable toward your torso with one arm.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Landmine Row",
          "equipment": "barbell",
          "instructions": "Place the barbell in a landmine attachment and row the bar to your chest.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Renegade Row",
          "equipment": "dumbbells",
          "instructions": "Hold two dumbbells in a plank position, row one dumbbell at a time.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Inverted Row",
          "equipment": "bar or TRX",
          "instructions": "Hang under a bar and pull your chest toward the bar.",
          "image": "assets/Image/back_workout.jpeg"
        }
      ],
      "core": [
        {
          "name": "Hanging Leg Raise",
          "equipment": "pull-up bar",
          "instructions": "Hang from a bar and lift your legs up toward your chest.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Cable Crunch",
          "equipment": "cable machine",
          "instructions": "Kneel in front of a cable machine and crunch down holding the rope.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "V-ups",
          "equipment": "none",
          "instructions": "Lie on your back and simultaneously lift your legs and upper body to meet in the middle.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Side Plank",
          "equipment": "none",
          "instructions": "Hold a side plank position with your body in a straight line.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Flutter Kicks",
          "equipment": "none",
          "instructions": "Lie on your back and flutter your legs up and down.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Ab Wheel Rollout",
          "equipment": "ab wheel",
          "instructions": "Kneel and roll the ab wheel forward, extending your body, and return to start.",
          "image": "assets/Image/core_workout.jpeg"
        }
      ],
      "triceps": [
        {
          "name": "Tricep Pushdown (Cable)",
          "equipment": "cable machine",
          "instructions": "Stand in front of a cable machine and push the rope attachment downward.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Dips (Parallel Bars)",
          "equipment": "parallel bars",
          "instructions": "Use parallel bars to perform dips while keeping your torso upright.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Overhead Cable Extension",
          "equipment": "cable machine",
          "instructions": "Use a rope attachment to extend the cable overhead, engaging the triceps.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Incline Skull Crushers",
          "equipment": "EZ bar",
          "instructions": "Perform skull crushers on an incline bench.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Diamond Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups with your hands in a diamond shape under your chest.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Seated Tricep Press",
          "equipment": "dumbbell",
          "instructions": "Sit on a bench and press a dumbbell overhead, focusing on your triceps.",
          "image": "assets/Image/triceps_workout.jpeg"
        }
      ],
      "push": [
        {
          "name": "Dumbbell Chest Press",
          "equipment": "dumbbells, bench",
          "instructions": "Lie on a bench and press dumbbells from chest level up toward the ceiling.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Incline Dumbbell Press",
          "equipment": "dumbbells, bench",
          "instructions": "Set the bench to an incline and press the dumbbells overhead.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Barbell Overhead Press",
          "equipment": "barbell",
          "instructions": "Press the barbell from shoulder height straight overhead.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Diamond Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups with your hands in a diamond shape under your chest.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Dips (Parallel Bars)",
          "equipment": "parallel bars",
          "instructions": "Use parallel bars to dip your body, targeting the chest and triceps.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Arnold Press",
          "equipment": "dumbbells",
          "instructions": "Perform a shoulder press while rotating the dumbbells throughout the motion.",
          "image": "assets/Image/push_workout.jpeg"
        }
      ],
      "pull": [
        {
          "name": "Pull-ups",
          "equipment": "pull-up bar",
          "instructions": "Pull your body up on a bar until your chin clears the bar.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Bent-Over Row",
          "equipment": "barbell or dumbbells",
          "instructions": "Bend at the waist and row the weight to your chest.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Hammer Curls",
          "equipment": "dumbbells",
          "instructions": "Curl the dumbbells with your palms facing each other.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Inverted Row",
          "equipment": "bar or TRX",
          "instructions": "Hang under a bar or TRX and pull your body upward.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Renegade Row",
          "equipment": "dumbbells",
          "instructions": "Hold two dumbbells in a plank position and row one dumbbell at a time.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "T-Bar Row",
          "equipment": "T-bar machine",
          "instructions": "Pull the T-bar handle toward your chest while bent over at the waist.",
          "image": "assets/Image/pull_workout.jpeg"
        }
      ]
    },
    "advanced": {
      "biceps": [
        {
          "name": "21s Bicep Curl",
          "equipment": "barbell",
          "instructions": "Perform 7 partial reps from the bottom to mid-range, 7 mid-range to full, and 7 full-range reps.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Spider Curl",
          "equipment": "barbell or dumbbell",
          "instructions": "Lie chest-down on an incline bench and curl the weight upward.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "One-Arm Cable Curl",
          "equipment": "cable machine",
          "instructions": "Perform single-arm curls with the cable pulley in a staggered stance.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Reverse-Grip Barbell Curl",
          "equipment": "barbell",
          "instructions": "Perform curls with an overhand grip to emphasize the forearms and brachialis.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Close-Grip Barbell Curl",
          "equipment": "barbell",
          "instructions": "Use a narrow grip to target the outer biceps.",
          "image": "assets/Image/biceps_workout.jpeg"
        },
        {
          "name": "Incline Cable Curl",
          "equipment": "cable machine",
          "instructions": "Sit on an incline bench with a cable pulley and perform curls.",
          "image": "assets/Image/biceps_workout.jpeg"
        }
      ],
      "chest": [
        {
          "name": "Barbell Bench Press",
          "equipment": "barbell",
          "instructions": "Perform flat barbell bench presses with heavier weights.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Dumbbell Bench Press",
          "equipment": "dumbbell",
          "instructions": "Perform a bench press using dumbbells for greater range of motion.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Close-Grip Bench Press",
          "equipment": "barbell",
          "instructions": "Use a close grip to emphasize the triceps and inner chest.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "One-Arm Cable Chest Fly",
          "equipment": "cable machine",
          "instructions": "Perform chest flyes with one arm at a time.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Paused Bench Press",
          "equipment": "barbell",
          "instructions": "Pause at the bottom of the bench press before pushing up explosively.",
          "image": "assets/Image/chest_workout.jpeg"
        },
        {
          "name": "Clap Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups with an explosive clap at the top of each rep.",
          "image": "assets/Image/chest_workout.jpeg"
        }
      ],
      "legs": [
        {
          "name": "Barbell Squats",
          "equipment": "barbell",
          "instructions": "Perform squats with a barbell on your back.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Deadlifts",
          "equipment": "barbell",
          "instructions": "Lift a barbell from the ground with your legs straight and back flat.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Front Squats",
          "equipment": "barbell",
          "instructions": "Hold the barbell in front of your shoulders while performing squats.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Sumo Deadlift",
          "equipment": "barbell",
          "instructions": "Perform deadlifts with a wider stance and grip.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Jump Squats",
          "equipment": "none",
          "instructions": "Perform squats with an explosive jump at the top.",
          "image": "assets/Image/leg_workout.jpeg"
        },
        {
          "name": "Pistol Squats",
          "equipment": "none",
          "instructions": "Perform single-leg squats, lowering your body as far as possible.",
          "image": "assets/Image/leg_workout.jpeg"
        }
      ],
      "back": [
        {
          "name": "Pull-ups",
          "equipment": "pull-up bar",
          "instructions": "Grasp the pull-up bar with an overhand grip and pull yourself up.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Deadlifts",
          "equipment": "barbell",
          "instructions": "Lift the barbell from the ground with your back straight.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Bent-Over Dumbbell Row",
          "equipment": "dumbbells",
          "instructions": "Bend at the waist and row two dumbbells to your lower chest.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Seal Row",
          "equipment": "barbell, bench",
          "instructions": "Lie face-down on a bench and row the barbell underneath.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "Rack Pull",
          "equipment": "barbell",
          "instructions": "Perform a partial deadlift from a rack position to emphasize the back.",
          "image": "assets/Image/back_workout.jpeg"
        },
        {
          "name": "One-Arm Barbell Row",
          "equipment": "barbell",
          "instructions": "Use a barbell, gripping one end, and row the bar toward your torso.",
          "image": "assets/Image/back_workout.jpeg"
        }
      ],
      "core": [
        {
          "name": "Dragon Flag",
          "equipment": "bench",
          "instructions": "Lie on a bench and raise your body up while holding the bench for support.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Windshield Wipers",
          "equipment": "pull-up bar",
          "instructions": "Hang from a bar and move your legs side to side in a windshield wiper motion.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Hanging Knee Tucks",
          "equipment": "pull-up bar",
          "instructions": "Hang from a bar and tuck your knees toward your chest.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Weighted Russian Twists",
          "equipment": "weight plate",
          "instructions": "Hold a weight plate and twist your torso from side to side.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Toes-to-Bar",
          "equipment": "pull-up bar",
          "instructions": "Hang from a bar and raise your legs to touch your toes to the bar.",
          "image": "assets/Image/core_workout.jpeg"
        },
        {
          "name": "Medicine Ball Slams",
          "equipment": "medicine ball",
          "instructions": "Lift a medicine ball overhead and slam it to the ground forcefully.",
          "image": "assets/Image/core_workout.jpeg"
        }
      ],
      "triceps": [
        {
          "name": "Weighted Dips",
          "equipment": "parallel bars, weight belt",
          "instructions": "Perform dips with added weight using a dip belt.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "One-Arm Cable Pushdown",
          "equipment": "cable machine",
          "instructions": "Use a single handle attachment on a cable machine and push down one arm at a time.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Close-Grip Bench Press",
          "equipment": "barbell",
          "instructions": "Perform bench press with a narrow grip to target your triceps.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Reverse-Grip Tricep Pushdown",
          "equipment": "cable machine",
          "instructions": "Use an underhand grip on the cable machine and push down.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Weighted Bench Dips",
          "equipment": "bench, weight plate",
          "instructions": "Perform bench dips with a weight plate on your lap.",
          "image": "assets/Image/triceps_workout.jpeg"
        },
        {
          "name": "Ring Dips",
          "equipment": "gymnastic rings",
          "instructions": "Perform dips using gymnastic rings for extra instability.",
          "image": "assets/Image/triceps_workout.jpeg"
        }
      ],
      "push": [
        {
          "name": "Barbell Bench Press",
          "equipment": "barbell",
          "instructions": "Perform flat bench presses with a barbell, targeting your chest.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Push Press",
          "equipment": "barbell",
          "instructions": "Use a small dip in the knees to explosively press a barbell overhead.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Clap Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups and clap your hands together at the top of the movement.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Weighted Dips",
          "equipment": "parallel bars, weight belt",
          "instructions": "Perform dips with additional weight using a dip belt.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Close-Grip Bench Press",
          "equipment": "barbell",
          "instructions": "Use a narrow grip to press the barbell, targeting your triceps.",
          "image": "assets/Image/push_workout.jpeg"
        },
        {
          "name": "Handstand Push-ups",
          "equipment": "none",
          "instructions": "Perform push-ups in a handstand position, pressing your body upward.",
          "image": "assets/Image/push_workout.jpeg"
        }
      ],
      "pull": [
        {
          "name": "Deadlift",
          "equipment": "barbell",
          "instructions": "Lift a barbell from the floor by keeping your back straight and pulling it up to your hips.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Weighted Pull-ups",
          "equipment": "pull-up bar, weight belt",
          "instructions": "Perform pull-ups with additional weight using a dip belt.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "One-Arm Dumbbell Row",
          "equipment": "dumbbells",
          "instructions": "Row one dumbbell at a time while standing or kneeling on a bench.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Barbell Bicep Curl",
          "equipment": "barbell",
          "instructions": "Curl the barbell toward your chest while keeping your elbows locked in place.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Seal Row",
          "equipment": "barbell, bench",
          "instructions": "Lie on a bench and pull the barbell toward your chest while lying face down.",
          "image": "assets/Image/pull_workout.jpeg"
        },
        {
          "name": "Rack Pull",
          "equipment": "barbell, squat rack",
          "instructions": "Perform a partial deadlift from the rack position to target your back.",
          "image": "assets/Image/pull_workout.jpeg"
        }
      ]
    }
  }
];
