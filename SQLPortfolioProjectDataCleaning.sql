--SELECT *
--FROM NashvilleHousing



--SELECT SaleDate
--FROM NashvilleHousing



--ALTER TABLE NashvilleHousing
--ALTER COLUMN SaleDate DATE



--SELECT *
--FROM NashvilleHousing
--WHERE PropertyAddress is null
--order by PropertyAddress



--SELECT A.ParcelID , A.PropertyAddress , B.ParcelID , B.PropertyAddress, ISNULL(A.PropertyAddress,B.PropertyAddress)
--FROM PortfolioProject.dbo.NashvilleHousing AS A
--	Join PortfolioProject.dbo.NashvilleHousing AS B
--	ON A.ParcelID = B.ParcelID
--	AND A.[UniqueID ] <> B.[UniqueID ] 
--WHERE A.PropertyAddress is null



--UPDATE A
--SET PropertyAddress = ISNULL(A.PropertyAddress,B.PropertyAddress)
--FROM PortfolioProject.dbo.NashvilleHousing AS A
--	Join PortfolioProject.dbo.NashvilleHousing AS B
--	ON A.ParcelID = B.ParcelID
--	AND A.[UniqueID ] <> B.[UniqueID ] 
--WHERE A.PropertyAddress is null



--SELECT
--SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) AS Address,
--SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress)) AS Address
--FROM PortfolioProject..NashvilleHousing



--SELECT
--SUBSTRING(PropertyAddress, 1,4) AS PostCode
--FROM PortfolioProject..NashvilleHousing



--ALTER TABLE NashvilleHousing
--ADD PropertySplitAddress NVARCHAR(255);

--UPDATE PortfolioProject..NashvilleHousing
--SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)

--ALTER TABLE NashvilleHousing
--ADD PropertySplitCity NVARCHAR(255);

--UPDATE PortfolioProject..NashvilleHousing
--SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))



--SELECT OwnerAddress
--FROM PortfolioProject..NashvilleHousing



--SELECT 
--PARSENAME(REPLACE(OwnerAddress,',','.'),3) AS Address,
--PARSENAME(REPLACE(OwnerAddress,',','.'),2) AS City,
--PARSENAME(REPLACE(OwnerAddress,',','.'),1) AS State
--FROM PortfolioProject..NashvilleHousing


--ALTER TABLE NashvilleHousing
--ADD OwnerSplitAddress NVARCHAR(255);

--UPDATE NashvilleHousing
--SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

--ALTER TABLE NashvilleHousing
--ADD OwnerSplitCity NVARCHAR(255);

--UPDATE NashvilleHousing
--SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

--ALTER TABLE NashvilleHousing
--ADD OwnerSplitState NVARCHAR(255);

--UPDATE NashvilleHousing
--SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)


--SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
--FROM NashvilleHousing
--GROUP BY SoldAsVacant



--SELECT SoldAsVacant,
--CASE 
--	WHEN SoldAsVacant = 'Y' THEN 'Yes'
--	WHEN SoldAsVacant = 'N' THEN 'No'
--	ELSE SoldAsVacant
--END
--FROM PortfolioProject..NashvilleHousing


--UPDATE NashvilleHousing
--SET SoldAsVacant = CASE 
--	WHEN SoldAsVacant = 'Y' THEN 'Yes'
--	WHEN SoldAsVacant = 'N' THEN 'No'
--	ELSE SoldAsVacant
--END



--SELECT *,
--	ROW_NUMBER() OVER
--	(PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
--	ORDER BY UniqueID) AS row_num
--	FROM PortfolioProject..NashvilleHousing
--	ORDER BY ParcelID



--WITH RowNumCTE AS(
--SELECT *,
--	ROW_NUMBER() OVER
--	(PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
--	ORDER BY UniqueID) AS row_num
--	FROM PortfolioProject..NashvilleHousing
--	--ORDER BY ParcelID
--	)

--SELECT *
--FROM RowNumCTE
--WHERE row_num >1
--ORDER BY PropertyAddress




--WITH RowNumCTE AS(
--SELECT *,
--	ROW_NUMBER() OVER
--	(PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
--	ORDER BY UniqueID) AS row_num
--	FROM PortfolioProject..NashvilleHousing
--	--ORDER BY ParcelID
--	)

--SELECT *
--FROM RowNumCTE
--WHERE row_num >1
--ORDER BY PropertyAddress



SELECT * 
FROM PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
DROP COLUMN OwnerAddress,TaxDistrict,PropertyAddress
