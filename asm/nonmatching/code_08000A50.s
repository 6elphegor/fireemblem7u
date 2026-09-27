	.include "macro.inc"

	.syntax unified

	thumb_func_start AgbMain
AgbMain: @ 0x08000A50
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08000AF8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08000AFC @ =0x85001FE0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_080009FC
	ldr r1, _08000B00 @ =0x04000204
	ldr r2, _08000B04 @ =0x000045B4
	adds r0, r2, #0
	strh r0, [r1]
	bl IrqInit
	movs r0, #0
	bl SetOnVBlank
	ldr r1, _08000B08 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _08000B0C @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	ldr r4, _08000B10 @ =0x08B857F8
	ldr r0, [r4]
	bl InitKeySt
	ldr r0, [r4]
	bl RefreshKeySt
	bl InitRamFuncs
	bl SramInit
	bl Proc_Init
	bl InitSpriteAnims
	bl MU_Init
	ldr r0, _08000B14 @ =0x42D690E9
	bl RandInitB
	bl RandNextB
	bl RandInit
	bl LoadAndVerifySramSaveData
	bl m4aSoundInit
	bl sub_08003F6C
	ldr r0, _08000B18 @ =OnVBlank
	bl SetOnVBlank
	movs r0, #0
	bl SetLang
	bl StartGame
_08000AEE:
	bl RunMainFunc
	bl SoftResetIfKeyCombo
	b _08000AEE
	.align 2, 0
_08000AF8: .4byte 0x040000D4
_08000AFC: .4byte 0x85001FE0
_08000B00: .4byte 0x04000204
_08000B04: .4byte 0x000045B4
_08000B08: .4byte 0x04000004
_08000B0C: .4byte 0x04000208
_08000B10: .4byte 0x08B857F8
_08000B14: .4byte 0x42D690E9
_08000B18: .4byte OnVBlank
