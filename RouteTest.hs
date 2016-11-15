{-# LANGUAGE CPP               #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}

module RouteTest
    where

import           Airship
import           Criterion.Main


resource :: Monad m => Resource m
resource = defaultResource { contentTypesProvided = return [("text/plain", return (escapedResponse "some fake resource"))]
                           , generateETag = return $ Just $ Strong "abc123"
                           }


routes :: RoutingSpec IO ()
routes = do
    "a"                #> resource
    "b"                #> resource
    "c"                #> resource
    "d"                #> resource
    "e"                #> resource
    "f"                #> resource
    "g"                #> resource
    "h"                #> resource
    "i"                #> resource
    "j"                #> resource
    "k"                #> resource
    "l"                #> resource
    "m"                #> resource
    "n"                #> resource
    "o"                #> resource
    "p"                #> resource
    "q"                #> resource
    "r"                #> resource
    "s"                #> resource
    "t"                #> resource
    "y"                #> resource
    "v"                #> resource
    "w"                #> resource
    "x"                #> resource
    "y"                #> resource
    "z"                #> resource
    "a" </> var "name" #> resource
    "a" </> var "name" </> "bcde" </> var "id" </> "fghij" #> resource
    "b" </> var "name" #> resource
    "c" </> var "name" #> resource
    "d" </> var "name" #> resource
    "e" </> var "name" #> resource
    "f" </> var "name" #> resource
    "g" </> var "name" #> resource
    "h" </> var "name" #> resource
    "i" </> var "name" #> resource
    "j" </> var "name" #> resource
    "k" </> var "name" #> resource
    "l" </> var "name" #> resource
    "m" </> var "name" #> resource
    "n" </> var "name" #> resource
    "o" </> var "name" #> resource
    "p" </> var "name" #> resource
    "q" </> var "name" #> resource
    "r" </> var "name" #> resource
    "s" </> var "name" #> resource
    "t" </> var "name" #> resource
    "u" </> var "name" #> resource
    "v" </> var "name" #> resource
    "w" </> var "name" #> resource
    "x" </> var "name" #> resource
    "y" </> var "name" #> resource
    "z" </> var "name" #> resource
    "apple" </> star   #> resource


main :: IO ()
main =
    let routeMapping = runRouter routes
    in defaultMain [
           -------------------------------------------------------
           -- Use this section to test the new routing code or
           -- comment it out to test the old code.
           -------------------------------------------------------
            bgroup "route" [ bench "a"  $ whnf (route routeMapping) "a"
                           , bench "b"  $ whnf (route routeMapping) "b"
                           , bench "c"  $ whnf (route routeMapping) "c"
                           , bench "z"  $ whnf (route routeMapping) "z"
                           , bench "a/name"  $ whnf (route routeMapping) "a/blarb"
                           , bench "b/name"  $ whnf (route routeMapping) "b/blarb"
                           , bench "c/name"  $ whnf (route routeMapping) "c/blarb"
                           , bench "z/name"  $ whnf (route routeMapping) "z/blarb"
                           , bench "long-route"  $ whnf (route routeMapping) "a/blarb/bcde/rhubarb/fghij"
                           , bench "wildcard" $ whnf (route routeMapping) "apple/orange"
                           ]
           ]
           -------------------------------------------------------
           -- Uncomment this section to test the old routing code
           -------------------------------------------------------
           --  bgroup "route" [ bench "a"  $ whnf (route routeMapping) ["a"]
           --                 , bench "b"  $ whnf (route routeMapping) ["b"]
           --                 , bench "c"  $ whnf (route routeMapping) ["c"]
           --                 , bench "z"  $ whnf (route routeMapping) ["z"]
           --                 , bench "a/name"  $ whnf (route routeMapping) ["a", "blarb"]
           --                 , bench "b/name"  $ whnf (route routeMapping) ["b", "blarb"]
           --                 , bench "c/name"  $ whnf (route routeMapping) ["c", "blarb"]
           --                 , bench "z/name"  $ whnf (route routeMapping) ["z", "blarb"]
           --                 , bench "long-route"  $ whnf (route routeMapping) ["a", "blarb", "bcde", "rhubarb", "fghij"]
           --                  , bench "wildcard" $ whnf (route routeMapping) ["apple", "orange"]
           --                 ]
           -- ]
