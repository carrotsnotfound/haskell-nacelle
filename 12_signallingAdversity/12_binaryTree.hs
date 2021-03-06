module BinaryTree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f x = case f x of 
               Nothing -> Leaf
               Just (a, b, c) -> Node (unfold f a)
                                      b
                                      (unfold f c)

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (\x -> if x < n then Just (x+1, x, x+1) else Nothing) 0
