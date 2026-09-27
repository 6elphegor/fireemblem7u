	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_SetHBlank
EkrLvup_SetHBlank: @ 0x0806987C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6d
	ble _080698A2
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl EkrLvupApfxEndEach
	ldr r0, _080698A8 @ =EkrLvupHBlank
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_080698A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080698A8: .4byte EkrLvupHBlank
