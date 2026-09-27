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
	bl sub_0809F924
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

	thumb_func_start PutBuildInfo
PutBuildInfo: @ 0x08000B1C
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
	adds r4, r0, #0
	ldr r1, _08000B50 @ =0x080C57E0
	bl DebugPutStr
	subs r4, #0x40
	ldr r1, _08000B54 @ =0x080C57FC
	adds r0, r4, #0
	bl DebugPutStr
	pop {r4}
	pop {r0, r1, r2}
	mov fp, r1
	mov sp, r2
	bx r0
	.align 2, 0
_08000B50: .4byte 0x080C57E0
_08000B54: .4byte 0x080C57FC

	thumb_func_start IrqInit
IrqInit: @ 0x08000B58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08000B62:
	ldr r0, [r7]
	cmp r0, #0xd
	ble _08000B6A
	b _08000B88
_08000B6A:
	ldr r0, _08000B80 @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08000B84 @ =DummyIrqRoutine
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08000B62
	.align 2, 0
_08000B80: .4byte 0x030028E0
_08000B84: .4byte DummyIrqRoutine
_08000B88:
	ldr r0, _08000BA4 @ =IrqMain
	ldr r1, _08000BA8 @ =0x03003950
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, _08000BAC @ =0x03007FFC
	ldr r1, _08000BA8 @ =0x03003950
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BA4: .4byte IrqMain
_08000BA8: .4byte 0x03003950
_08000BAC: .4byte 0x03007FFC

	thumb_func_start DummyIrqRoutine
DummyIrqRoutine: @ 0x08000BB0
	push {r7, lr}
	mov r7, sp
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetIrqFunc
SetIrqFunc: @ 0x08000BBC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08000BDC @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	str r1, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BDC: .4byte 0x030028E0
