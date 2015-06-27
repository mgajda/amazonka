{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.EC2.DeleteDHCPOptions
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

-- | Deletes the specified set of DHCP options. You must disassociate the set
-- of DHCP options before you can delete it. You can disassociate the set
-- of DHCP options by associating either a new set of options or the
-- default set of options with the VPC.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DeleteDHCPOptions.html>
module Network.AWS.EC2.DeleteDHCPOptions
    (
    -- * Request
      DeleteDHCPOptions
    -- ** Request constructor
    , deleteDHCPOptions
    -- ** Request lenses
    , ddhcpoDryRun
    , ddhcpoDHCPOptionsId

    -- * Response
    , DeleteDHCPOptionsResponse
    -- ** Response constructor
    , deleteDHCPOptionsResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteDHCPOptions' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ddhcpoDryRun'
--
-- * 'ddhcpoDHCPOptionsId'
data DeleteDHCPOptions = DeleteDHCPOptions'
    { _ddhcpoDryRun        :: !(Maybe Bool)
    , _ddhcpoDHCPOptionsId :: !Text
    } deriving (Eq,Read,Show)

-- | 'DeleteDHCPOptions' smart constructor.
deleteDHCPOptions :: Text -> DeleteDHCPOptions
deleteDHCPOptions pDHCPOptionsId =
    DeleteDHCPOptions'
    { _ddhcpoDryRun = Nothing
    , _ddhcpoDHCPOptionsId = pDHCPOptionsId
    }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
ddhcpoDryRun :: Lens' DeleteDHCPOptions (Maybe Bool)
ddhcpoDryRun = lens _ddhcpoDryRun (\ s a -> s{_ddhcpoDryRun = a});

-- | The ID of the DHCP options set.
ddhcpoDHCPOptionsId :: Lens' DeleteDHCPOptions Text
ddhcpoDHCPOptionsId = lens _ddhcpoDHCPOptionsId (\ s a -> s{_ddhcpoDHCPOptionsId = a});

instance AWSRequest DeleteDHCPOptions where
        type Sv DeleteDHCPOptions = EC2
        type Rs DeleteDHCPOptions = DeleteDHCPOptionsResponse
        request = post
        response = receiveNull DeleteDHCPOptionsResponse'

instance ToHeaders DeleteDHCPOptions where
        toHeaders = const mempty

instance ToPath DeleteDHCPOptions where
        toPath = const "/"

instance ToQuery DeleteDHCPOptions where
        toQuery DeleteDHCPOptions'{..}
          = mconcat
              ["Action" =: ("DeleteDHCPOptions" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _ddhcpoDryRun,
               "DhcpOptionsId" =: _ddhcpoDHCPOptionsId]

-- | /See:/ 'deleteDHCPOptionsResponse' smart constructor.
data DeleteDHCPOptionsResponse =
    DeleteDHCPOptionsResponse'
    deriving (Eq,Read,Show)

-- | 'DeleteDHCPOptionsResponse' smart constructor.
deleteDHCPOptionsResponse :: DeleteDHCPOptionsResponse
deleteDHCPOptionsResponse = DeleteDHCPOptionsResponse'
