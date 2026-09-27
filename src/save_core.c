#include "gbafe.h"

char const SaveMarker[] = "AGB-FE7";

CONST_DATA struct SramMain * gSramMain = CART_SRAM;
extern bool EWRAM_DATA gIsSramWorking;

void SramInit(void)
{
    u32 buf[2];

    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();

    REG_IE |= INTR_FLAG_GAMEPAK;

    WriteSramFast(&buf[0], (void *)gSramMain + 0x73B8, sizeof(u32));
    ReadSramFast((void *)gSramMain + 0x73B8, &buf[1], sizeof(u32));

    gIsSramWorking = (buf[1] == buf[0]) ? TRUE : FALSE;
}

bool IsSramWorking(void)
{
    return gIsSramWorking;
}

void WipeSram(void)
{
    u32 buf[0x10];
    int i;

    for (i = 0; i < (int) ARRAY_COUNT(buf); i++)
        buf[i] = 0xFFFFFFFF;

    for (i = 0; i < CART_SRAM_SIZE / (int) sizeof(buf); i++)
        WriteAndVerifySramFast(buf, (void *)gSramMain + i * sizeof(buf), sizeof(buf));
}

u16 Checksum16(void const * data, int size)
{
    u16 const * data_u16 = data;

    int i;

    u32 add_acc = 0;
    u32 xor_acc = 0;

    for (i = 0; i < size / 2; ++i)
    {
        add_acc += data_u16[i];
        xor_acc ^= data_u16[i];
    }

    return add_acc + xor_acc;
}

bool ReadGlobalSaveInfo(struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;

    if (!IsSramWorking())
        return FALSE;

    if (info == NULL)
        info = &local_info;

    ReadSramFast(&gSramMain->head, info, sizeof(struct GlobalSaveInfo));

    if (!StringEquals(info->name, SaveMarker))
        return FALSE;

    if (info->magic32 == SAVE_MAGIC32 && info->magic16 == SAVE_MAGIC16 && info->checksum == Checksum16(info, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM))
        return TRUE;

    return FALSE;
}

void WriteGlobalSaveInfo(struct GlobalSaveInfo * info)
{
    info->checksum = Checksum16(info, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM);
    WriteAndVerifySramFast(info, &gSramMain->head, sizeof(struct GlobalSaveInfo));
}

void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo * info)
{
    WriteAndVerifySramFast(info, &gSramMain->head, sizeof(struct GlobalSaveInfo));
}

void InitGlobalSaveInfo(void);
ASM_FUNC("asm/nonmatching/code_0809E5AC.s");


void ResetFe6LinkSaveInfo(void)
{
    u8 buf[0x24];
    CPU_FILL(0, buf, sizeof(buf), 16);
    WriteFe6LinkSaveInfo(buf);
}

void EraseBonusContentData(void)
{
    u8 * buf = gBuf;
    CPU_FILL(0, buf, 0x284, 16);
    SaveBonusContentData(buf);
}

void * SramOffsetToAddr(u16 off)
{
    return ((void *) gSramMain) + off;
}

u16 SramAddrToOffset(void * addr)
{
    return ((u8 *) addr) - ((u8 *) (void *) gSramMain);
}

bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
ASM_FUNC("asm/nonmatching/code_0809E6FC.s");


void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id)
{
    block_info->magic16 = SAVE_MAGIC16;

#if BUGFIX
    chuck->offset = SramAddrToOffset(GetSaveWriteAddr(save_id));
#else
    block_info->offset = (uintptr_t)GetSaveWriteAddr(save_id);
#endif

    if (save_id >= SAVE_COUNT)
        return;

    switch (block_info->kind)
    {
        case SAVE_KIND_GAME:
            block_info->size = 0xD8C;
            break;

        case SAVE_KIND_SUSPEND:
            block_info->size = 0x1F2C;
            break;

        case SAVE_KIND_MULTIARENA:
            block_info->size = 0x874;
            break;

        case SAVE_KIND_XMAP:
            block_info->size = 0xC00;
            break;

        case SAVE_KIND_INVALID:
            block_info->size = 0;
            block_info->offset = 0;
            block_info->magic16 = 0;
            break;

        default:
            return;
    }

    PopulateSaveBlockChecksum(block_info);
    WriteAndVerifySramFast(block_info, &gSramMain->block_info[save_id], sizeof(struct SaveBlockInfo));
}

void EraseSaveBlockInfo(int index)
{
    struct SaveBlockInfo chunk;

    if (index < SAVE_COUNT) {
        CpuFill16(0xFFFF, &chunk, sizeof(struct SaveBlockInfo));
        WriteAndVerifySramFast(
            &chunk,
            &gSramMain->block_info[index],
            sizeof(struct SaveBlockInfo));
    }
}

void * GetSaveWriteAddr(int save_id);
ASM_FUNC("asm/nonmatching/code_0809E870.s");


void * GetSaveReadAddr(int save_id)
{
    struct SaveBlockInfo block_info;
    ReadSaveBlockInfo(&block_info, save_id);
    return SramOffsetToAddr(block_info.offset);
}
