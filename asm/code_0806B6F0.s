	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrPopup_MarkEnd
ekrPopup_MarkEnd: @ 0x0806B6F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806B716
	ldr r0, _0806B71C @ =0x0202013C
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0806B716:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B71C: .4byte 0x0202013C
