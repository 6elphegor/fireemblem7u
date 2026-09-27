	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_End
ModeSelect_End: @ 0x080A8624
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl EndModeSelectAnims
	bl EndEfxAnimeDrvProc
	movs r0, #0
	bl EndFaceById
	adds r4, #0x42
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080A8656
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A865C
_080A8656:
	movs r0, #0
	bl SetOnHBlankA
_080A865C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
