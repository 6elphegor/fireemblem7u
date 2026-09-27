	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenProc_SetupMapIdle
PrepScreenProc_SetupMapIdle: @ 0x0803095C
	push {r4, lr}
	adds r4, r0, #0
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803097A
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne _08030974
	bl Prep_ShowDeployableTiles
_08030974:
	adds r0, r4, #0
	bl Proc_Break
_0803097A:
	ldr r1, _08030990 @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl PutMapCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030990: .4byte 0x0202BBB8
