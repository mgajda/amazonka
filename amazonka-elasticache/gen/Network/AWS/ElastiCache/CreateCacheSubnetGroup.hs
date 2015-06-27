{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.ElastiCache.CreateCacheSubnetGroup
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | The /CreateCacheSubnetGroup/ action creates a new cache subnet group.
--
-- Use this parameter only when you are creating a cluster in an Amazon
-- Virtual Private Cloud (VPC).
--
-- <http://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html>
module Network.AWS.ElastiCache.CreateCacheSubnetGroup
    (
    -- * Request
      CreateCacheSubnetGroup
    -- ** Request constructor
    , createCacheSubnetGroup
    -- ** Request lenses
    , ccsgCacheSubnetGroupName
    , ccsgCacheSubnetGroupDescription
    , ccsgSubnetIds

    -- * Response
    , CreateCacheSubnetGroupResponse
    -- ** Response constructor
    , createCacheSubnetGroupResponse
    -- ** Response lenses
    , creCacheSubnetGroup
    , creStatus
    ) where

import           Network.AWS.ElastiCache.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input of a /CreateCacheSubnetGroup/ action.
--
-- /See:/ 'createCacheSubnetGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ccsgCacheSubnetGroupName'
--
-- * 'ccsgCacheSubnetGroupDescription'
--
-- * 'ccsgSubnetIds'
data CreateCacheSubnetGroup = CreateCacheSubnetGroup'
    { _ccsgCacheSubnetGroupName        :: !Text
    , _ccsgCacheSubnetGroupDescription :: !Text
    , _ccsgSubnetIds                   :: ![Text]
    } deriving (Eq,Read,Show)

-- | 'CreateCacheSubnetGroup' smart constructor.
createCacheSubnetGroup :: Text -> Text -> CreateCacheSubnetGroup
createCacheSubnetGroup pCacheSubnetGroupName pCacheSubnetGroupDescription =
    CreateCacheSubnetGroup'
    { _ccsgCacheSubnetGroupName = pCacheSubnetGroupName
    , _ccsgCacheSubnetGroupDescription = pCacheSubnetGroupDescription
    , _ccsgSubnetIds = mempty
    }

-- | A name for the cache subnet group. This value is stored as a lowercase
-- string.
--
-- Constraints: Must contain no more than 255 alphanumeric characters or
-- hyphens.
--
-- Example: @mysubnetgroup@
ccsgCacheSubnetGroupName :: Lens' CreateCacheSubnetGroup Text
ccsgCacheSubnetGroupName = lens _ccsgCacheSubnetGroupName (\ s a -> s{_ccsgCacheSubnetGroupName = a});

-- | A description for the cache subnet group.
ccsgCacheSubnetGroupDescription :: Lens' CreateCacheSubnetGroup Text
ccsgCacheSubnetGroupDescription = lens _ccsgCacheSubnetGroupDescription (\ s a -> s{_ccsgCacheSubnetGroupDescription = a});

-- | A list of VPC subnet IDs for the cache subnet group.
ccsgSubnetIds :: Lens' CreateCacheSubnetGroup [Text]
ccsgSubnetIds = lens _ccsgSubnetIds (\ s a -> s{_ccsgSubnetIds = a});

instance AWSRequest CreateCacheSubnetGroup where
        type Sv CreateCacheSubnetGroup = ElastiCache
        type Rs CreateCacheSubnetGroup =
             CreateCacheSubnetGroupResponse
        request = post
        response
          = receiveXMLWrapper "CreateCacheSubnetGroupResult"
              (\ s h x ->
                 CreateCacheSubnetGroupResponse' <$>
                   (x .@? "CacheSubnetGroup") <*> (pure (fromEnum s)))

instance ToHeaders CreateCacheSubnetGroup where
        toHeaders = const mempty

instance ToPath CreateCacheSubnetGroup where
        toPath = const "/"

instance ToQuery CreateCacheSubnetGroup where
        toQuery CreateCacheSubnetGroup'{..}
          = mconcat
              ["Action" =:
                 ("CreateCacheSubnetGroup" :: ByteString),
               "Version" =: ("2015-02-02" :: ByteString),
               "CacheSubnetGroupName" =: _ccsgCacheSubnetGroupName,
               "CacheSubnetGroupDescription" =:
                 _ccsgCacheSubnetGroupDescription,
               "SubnetIds" =:
                 toQueryList "SubnetIdentifier" _ccsgSubnetIds]

-- | /See:/ 'createCacheSubnetGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'creCacheSubnetGroup'
--
-- * 'creStatus'
data CreateCacheSubnetGroupResponse = CreateCacheSubnetGroupResponse'
    { _creCacheSubnetGroup :: !(Maybe CacheSubnetGroup)
    , _creStatus           :: !Int
    } deriving (Eq,Read,Show)

-- | 'CreateCacheSubnetGroupResponse' smart constructor.
createCacheSubnetGroupResponse :: Int -> CreateCacheSubnetGroupResponse
createCacheSubnetGroupResponse pStatus =
    CreateCacheSubnetGroupResponse'
    { _creCacheSubnetGroup = Nothing
    , _creStatus = pStatus
    }

-- | FIXME: Undocumented member.
creCacheSubnetGroup :: Lens' CreateCacheSubnetGroupResponse (Maybe CacheSubnetGroup)
creCacheSubnetGroup = lens _creCacheSubnetGroup (\ s a -> s{_creCacheSubnetGroup = a});

-- | FIXME: Undocumented member.
creStatus :: Lens' CreateCacheSubnetGroupResponse Int
creStatus = lens _creStatus (\ s a -> s{_creStatus = a});
