import 'package:flutter/material.dart';

import '../core/web_services/firebase_utils.dart';
import '../models/organ_model.dart';

// TODO: search for spinal cord and neuron in the nervous system

class SystemsData {
  static final List<OrganModel> _cardiovascularOrgans = [
    OrganModel(
      id: 00,
      title: "Cardiovascular System",
      system: "Cardiovascular System",
      description:
          """The cardiovascular system is responsible for circulating blood, nutrients, oxygen, and hormones throughout the body. It consists of the heart, arteries, veins, and capillaries.
Heart: A muscular organ that pumps blood through the circulatory system.\n
Arteries: Carry oxygen-rich blood away from the heart.\n
Veins: Return oxygen-poor blood back to the heart.\n
Capillaries: Facilitate the exchange of substances between blood and tissues.""",
      isFavorite: false,
      imagePath:
          "assets/images/cardiovascular_system/cardiovascular_system.png",
    ),
    OrganModel(
      id: 01,
      title: "Heart Anatomy",
      system: "Cardiovascular System",
      description:
          """The heart is a vital organ that pumps blood throughout the body, providing oxygen and nutrients to tissues and organs while removing waste products.
Chambers: Divided into four chambers - two atria and two ventricles - which receive and pump blood.\n
Valves: Ensure unidirectional blood flow within the heart.\n
Coronary Arteries: Supply oxygenated blood to the heart muscle.""",
      isFavorite: false,
      imagePath: "assets/images/cardiovascular_system/heart.png",
    ),
    OrganModel(
      id: 02,
      title: "Arteries and Veins Anatomy",
      system: "Cardiovascular System",
      description:
          """Arteries and veins form the circulatory system, transporting blood throughout the body.

- Arteries: Carry oxygen-rich blood away from the heart to the body's tissues.
- Veins: Return oxygen-poor blood back to the heart from the body's tissues.
- Valves: Present in veins to prevent back flow of blood.""",
      isFavorite: false,
      imagePath: "assets/images/cardiovascular_system/arteries_and_veins.png",
    ),
  ];
  static final List<OrganModel> _digestiveOrgans = [
    OrganModel(
      id: 20,
      title: "Digestive System",
      system: "Digestive System",
      description:
          """The digestive system processes food, extracts nutrients, and eliminates waste. It includes organs such as the mouth, stomach, small intestine, and large intestine.
Mouth: Begins mechanical and chemical digestion of food.\n
Stomach: Stores and breaks down food with gastric juices.\n
Small Intestine: Absorbs nutrients from digested food.\n
Large Intestine: Absorbs water and forms feces for elimination.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/digestive_system.png",
    ),
    OrganModel(
      id: 21,
      title: "Liver Anatomy",
      system: "Digestive System",
      description:
          """The liver is a vital organ located in the upper right abdomen responsible for numerous metabolic functions.
Lobes: Consists of two main lobes, left and right, each with specific functions.\n
Hepatocytes: Liver cells that perform metabolic processes such as detoxification and protein synthesis.\n
Bile Ducts: Transport bile produced by the liver to the gallbladder or small intestine for digestion.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/liver.png",
    ),
    OrganModel(
      id: 22,
      title: "Stomach Anatomy",
      system: "Digestive System",
      description:
          """The stomach is a muscular organ in the upper abdomen responsible for food storage and initial digestion.
Gastric Juices: Secreted by the stomach lining, containing enzymes and acids for digestion.\n
Rugae: Folds in the stomach lining that expand to accommodate food.\n
Sphincters: Control the entry and exit of food into and out of the stomach.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/stomach.png",
    ),
    OrganModel(
      id: 23,
      title: "Large Intestine Anatomy",
      system: "Digestive System",
      description:
          """The large intestine, or colon, absorbs water and forms feces for elimination from the body.
Cecum: The pouch-like structure that connects the small intestine to the colon.\n
Colon: Divided into segments including the ascending, transverse, descending, and sigmoid colon.\n
Microbiota: Beneficial bacteria inhabit the large intestine and aid in digestion.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/large_intestine.png",
    ),
    OrganModel(
      id: 24,
      title: "Small Intestine Anatomy",
      system: "Digestive System",
      description:
          """The small intestine is where most digestion and nutrient absorption occur.
Villi: Finger-like projections in the lining of the small intestine that increase surface area for absorption.\n
Absorptive Cells: Line the villi and absorb nutrients into the bloodstream.\n
Brunner's Glands: Secrete alkaline mucus to neutralize stomach acid in the duodenum.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/small_intestine.png",
    ),
    OrganModel(
      id: 27,
      title: "Duodenum Anatomy",
      system: "Digestive System",
      description:
          """The duodenum is the first part of the small intestine, where digestion continues.
Duodenal Papilla: Opening through which bile and pancreatic secretions enter the duodenum.\n
Brunner's Glands: Produce mucus to protect the duodenum from acidic chyme.\n
Major Duodenal Papilla: Site where pancreatic duct and common bile duct empty into the duodenum.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/duodenum.png",
    ),
    OrganModel(
      id: 25,
      title: "Pancreas Anatomy",
      system: "Digestive System",
      description:
          """The pancreas is a glandular organ located behind the stomach, with both endocrine and exocrine functions.
Islets of Langerhans: Clusters of cells that produce hormones such as insulin and glucagon.\n
Pancreatic Ducts: Transport digestive enzymes produced by the pancreas into the duodenum.\n
Acinar Cells: Secrete digestive enzymes into pancreatic ducts for release into the small intestine.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/pancreas.png",
    ),
    OrganModel(
      id: 26,
      title: "Gallbladder Anatomy",
      system: "Digestive System",
      description:
          """The gallbladder is a small organ located beneath the liver, storing and concentrating bile produced by the liver.
Cystic Duct: Connects the gallbladder to the common bile duct.\n
Bile: Produced by the liver and stored in the gallbladder, aids in the digestion and absorption of fats.\n
Gallstones: Hardened deposits that can form in the gallbladder due to imbalances in bile composition.""",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/gallbladder.png",
    ),
  ];
  static final List<OrganModel> _nervousOrgans = [
    OrganModel(
      id: 40,
      title: "Nervous System",
      system: "Nervous System",
      description:
          """The nervous system controls and coordinates bodily functions and activities. It comprises the brain, spinal cord, and nerves.
Brain: Control center of the nervous system, responsible for processing information and coordinating body activities.\n
Spinal Cord: Transmits signals between the brain and the rest of the body.\n
Nerves: Transmit electrical impulses throughout the body.""",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/nervous_system.png",
    ),
    OrganModel(
      id: 41,
      title: "Brain Anatomy",
      system: "Nervous System",
      description:
          """The brain is the command center of the nervous system, responsible for processing sensory information, coordinating motor responses, and regulating basic bodily functions.
Cerebrum: Largest part of the brain, responsible for higher cognitive functions such as thinking and memory.\n
Cerebellum: Located below the cerebrum, involved in coordination and balance.\n
Brainstem: Connects the brain to the spinal cord and regulates basic functions like breathing and heartbeat.""",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/brain.png",
    ),
    OrganModel(
      id: 42,
      title: "Nervous Anatomy",
      system: "Nervous System",
      description:
          """The nervous system includes a complex network of nerves, neurons, and supporting cells that transmit signals between different parts of the body.
Neurons: Specialized cells that transmit electrical impulses.\n
Axons: Transmit signals away from the cell body.\n
Dendrites: Receive signals from other neurons.""",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/nervous.png",
    ),
  ];
  static final List<OrganModel> _respiratoryOrgans = [
    OrganModel(
      id: 60,
      title: "Respiratory System",
      system: "Respiratory System",
      description:
          """The respiratory system facilitates the exchange of oxygen and carbon dioxide between the body and the environment. It includes organs such as the nose, trachea, bronchi, and lungs.
Nose: Filters, warms, and humidifies inhaled air.\n
Trachea: Windpipe that carries air to the lungs.\n
Lungs: Organs where gas exchange takes place.""",
      isFavorite: false,
      imagePath: "assets/images/respiratory_system/respiratory_system.png",
    ),
    OrganModel(
      id: 61,
      title: "Lungs Anatomy",
      system: "Respiratory System",
      description:
          """The lungs are paired organs responsible for the exchange of oxygen and carbon dioxide between the body and the environment.
Bronchi: Large air passages that branch off the trachea and lead to the lungs.\n
Alveoli: Tiny air sacs where gas exchange occurs.\n
Diaphragm: Dome-shaped muscle beneath the lungs that aids in breathing.""",
      isFavorite: false,
      imagePath: "assets/images/respiratory_system/lungs.png",
    ),
  ];
  static final List<OrganModel> _skeletonOrgan = [
    OrganModel(
      id: 80,
      title: "Skeleton System",
      system: "Skeleton System",
      description:
          """The skeletal system provides structure, support, and protection for the body's organs and tissues. It consists of bones, joints, ligaments, and tendons.
Bones: Provide structure and support for the body.\n
Joints: Allow for movement between bones.\n
Ligaments and Tendons: Connect bones and muscles.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/skeleton_system.png",
    ),
    OrganModel(
      id: 81,
      title: "Skull Anatomy",
      system: "Skeleton System",
      description:
          """The skull is the skeletal structure of the head, protecting the brain and supporting the face.
Cranial Bones: Surround and protect the brain.\n
Facial Bones: Form the structure of the face and protect sensory organs.\n
Sutures: Joints between cranial bones that allow for growth and flexibility.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/skull.png",
    ),
    OrganModel(
      id: 82,
      title: "Thoracic Cage Anatomy",
      system: "Skeleton System",
      description:
          """The thoracic cage, or rib cage, is a bony structure that protects the organs of the thoracic cavity, including the heart and lungs.
Ribs: Curved bones that form the rib cage.\n
Sternum: Breastbone located in the center of the chest.\n
Costal Cartilage: Connects the ribs to the sternum.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/thoracic_cage.png",
    ),
    OrganModel(
      id: 83,
      title: "Spine Anatomy",
      system: "Skeleton System",
      description:
          """The spine, or vertebral column, provides structural support and protects the spinal cord.
Vertebrae: Individual bones that make up the spine.\n
Intervertebral Discs: Cartilaginous cushions between vertebrae that provide flexibility and shock absorption.\n
Spinal Cord: Nervous tissue enclosed within the vertebral column, responsible for transmitting signals between the brain and the rest of the body.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/spine.png",
    ),
    OrganModel(
      id: 84,
      title: "Sacrum Anatomy",
      system: "Skeleton System",
      description:
          """The sacrum is a triangular bone located at the base of the spine, formed by the fusion of five vertebrae.
Sacral Foramina: Openings in the sacrum through which nerves and blood vessels pass.\n
Sacroiliac Joints: Joints between the sacrum and the ilium of the pelvis.\n
Coccyx: Small, triangular bone located below the sacrum.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/sacrum.png",
    ),
    OrganModel(
      id: 85,
      title: "Hand Anatomy",
      system: "Skeleton System",
      description:
          """The hand is a complex structure consisting of bones, muscles, tendons, and ligaments that allow for gripping and manipulating objects.
Carpals: Eight bones that make up the wrist.\n
Metacarpals: Five bones that form the palm of the hand.\n
Phalanges: Fourteen bones that make up the fingers and thumb.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/hand.png",
    ),
    OrganModel(
      id: 86,
      title: "Foot Anatomy",
      system: "Skeleton System",
      description:
          """The foot is a complex structure responsible for supporting the body's weight and facilitating movement.
Tarsals: Seven bones that make up the ankle and back of the foot.\n
Metatarsals: Five bones that form the sole of the foot.\n
Phalanges: Fourteen bones that make up the toes.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/foot.png",
    ),
    OrganModel(
      id: 87,
      title: "Leg Anatomy",
      system: "Skeleton System",
      description:
          """The leg is the lower limb of the body, consisting of bones, muscles, and other tissues.
Femur: Thigh bone, the longest and strongest bone in the body.\n
Tibia: Shinbone, located on the medial side of the leg.\n
Fibula: Smaller bone located on the lateral side of the leg.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/leg.png",
    ),
    OrganModel(
      id: 88,
      title: "Femur Anatomy",
      system: "Skeleton System",
      description:
          """The femur is the thigh bone, the longest and strongest bone in the body.
Head: Rounded portion of the femur that fits into the hip socket.\n
Neck: Narrow portion of the femur just below the head.\n
Shaft: Long, straight portion of the femur.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/femur.png",
    ),
    OrganModel(
      id: 89,
      title: "Humerus Anatomy",
      system: "Skeleton System",
      description:
          """The humerus is the upper arm bone, connecting the shoulder to the elbow.
Head: Rounded portion of the humerus that fits into the shoulder socket.\n
Shaft: Long, straight portion of the humerus.\n
Condyles: Rounded projections at the distal end of the humerus that articulate with the bones of the forearm.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/humerus.png",
    ),
    OrganModel(
      id: 90,
      title: "Radios Ulna Anatomy",
      system: "Skeleton System",
      description: """The radius and ulna are the two bones of the forearm.
Radius: Located on the lateral side of the forearm, connects to the thumb.\n
Ulna: Located on the medial side of the forearm, connects to the pinky finger.\n
Olecranon Process: Bony projection at the proximal end of the ulna that forms the elbow.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/radios_ulna.png",
    ),
    OrganModel(
      id: 91,
      title: "Hip Bone Anatomy",
      system: "Skeleton System",
      description:
          """The hip bone, or innominate bone, forms the pelvis along with the sacrum and coccyx.
Ilium: Largest and most superior portion of the hip bone.\n
Ischium: Inferior and posterior portion of the hip bone.\n
Pubis: Anterior portion of the hip bone, forms the pubic symphysis.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/hip_bone.png",
    ),
    OrganModel(
      id: 92,
      title: "Scapula Anatomy",
      system: "Skeleton System",
      description:
          """The scapula, or shoulder blade, is a flat, triangular bone located on the back of the shoulder.
Acromion Process: Bony projection at the top of the scapula that articulates with the clavicle.\n
Glenoid Cavity: Shallow depression on the lateral edge of the scapula that articulates with the humerus.\n
Spine of the Scapula: Ridge of bone on the posterior surface of the scapula.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/scapula.png",
    ),
    OrganModel(
      id: 93,
      title: "Patella Anatomy",
      system: "Skeleton System",
      description:
          """The patella, or kneecap, is a small, triangular bone located in front of the knee joint.
Apex: Pointed portion of the patella.\n
Base: Broad, upper portion of the patella.\n
Patellar Ligament: Connects the patella to the tibia.""",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/patella.png",
    ),
  ];

  static Map<String, List<OrganModel>> systemsOrgans = {
    "Cardiovascular System": _cardiovascularOrgans,
    "Digestive System": _digestiveOrgans,
    "Nervous System": _nervousOrgans,
    "Respiratory System": _respiratoryOrgans,
    "Skeleton System": _skeletonOrgan,
  };

  static final List<OrganModel> _myFavorites = [];

  static Future<void> getData(BuildContext context) async {
    final snapshot = await FirebaseUtils.getUserData();

    snapshot.listen((querySnapshot) {
      try {
        Map<String, dynamic> data =
            querySnapshot.data()! as Map<String, dynamic>;
        List<dynamic> favoriteItemIds = data["favoriteItemIds"];

        _myFavorites.clear();
        _getFavoriteOrgans(favoriteItemIds);
        _updateOrgans();
      } catch (e) {
        debugPrint("$e");
      }
    });
  }

  static void _updateOrgans() {
    for (var systemOrgans in systemsOrgans.values) {
      for (var organ in systemOrgans) {
        organ.isFavorite =
            _myFavorites.any((favorite) => favorite.id == organ.id);
      }
    }
  }

  static void _getFavoriteOrgans(List<dynamic> favoriteItemIds) {
    for (final itemId in favoriteItemIds) {
      for (final systemOrgans in SystemsData.systemsOrgans.values) {
        for (final organ in systemOrgans) {
          if (organ.id == itemId) {
            _myFavorites.add(organ..isFavorite = true);
            break;
          }
        }
      }
    }
  }
}
