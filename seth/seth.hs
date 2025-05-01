------------------------------------------------------------------------------
-- Category Theory Applied to Functional Programming
--
-- Haskell Code
------------------------------------------------------------------------------

-- Tested with GHC 7.6.3.

{-# LANGUAGE InstanceSigs   #-}
{-# LANGUAGE KindSignatures #-}

module Seth where

import Prelude ()

infixr 9 .

------------------------------------------------------------------------------
-- 2 Motivation
------------------------------------------------------------------------------

-- The map function.
map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs

-- The mapMaybe function.
mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing  = Nothing
mapMaybe f (Just x) = Just (f x)

------------------------------------------------------------------------------
-- 3 Categories
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Example 3.2

-- The Bool type.
data Bool = False | True

-- The not function.
not :: Bool -> Bool
not False = True
not True  = False

-- The id function.
id :: a -> a
id x = x

-- The (.) function.
(.) :: (b -> c) -> (a -> b) -> a -> c
(g . f) x = g (f x)

------------------------------------------------------------------------------
-- Remark 3.2

-- The undefined value.
undefined :: a
undefined = undefined

------------------------------------------------------------------------------
-- 4 Functors
------------------------------------------------------------------------------

-- The Functor type class.
class Functor f where
  fmap :: (a -> b) -> f a -> f b

-- The Functor type class.
-- class Functor (f :: * -> *) where
--   fmap :: (a -> b) -> (f a -> f b)

------------------------------------------------------------------------------
-- Example 4.2

-- The Maybe type constructor.
data Maybe a = Nothing | Just a

-- The Maybe functor.
instance Functor Maybe where
  fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap = mapMaybe

------------------------------------------------------------------------------
-- Example 4.3

-- The [] type constructor.
-- data [] a = [] | a : [a]

-- The [] functor.
instance Functor [] where
  fmap :: (a -> b) -> [a] -> [b]
  fmap = map

-- The map' function?
map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : f x : map' f xs

-- The [] functor?
-- instance Functor [] where
--   fmap :: (a -> b) -> [a] -> [b]
--   fmap = map'
