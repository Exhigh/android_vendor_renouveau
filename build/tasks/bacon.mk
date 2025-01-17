# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 Resurrection Remix
# Copyright (C) 2019 Renouveau
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Renouveau OTA update package

INTERNAL_OTA_PACKAGE_TARGET ?= $(PRODUCT_OUT)/$(TARGET_PRODUCT)-ota-$(FILE_NAME_TAG).zip
RENOUVEAU_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PRODUCT_BUILD).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(RENOUVEAU_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(RENOUVEAU_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(RENOUVEAU_TARGET_PACKAGE).md5sum
	@echo "Renouveau build complete: $(RENOUVEAU_TARGET_PACKAGE)" >&2
	$(hide) ./vendor/renouveau/tools/renouveau.sh
