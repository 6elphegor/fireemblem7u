	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030910
sub_08030910: @ 0x08030910
	push {r4, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _08030930
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _08030938
_08030930:
	movs r0, #0
	movs r1, #0
	bl SetMapCursorPosition
_08030938:
	ldr r4, _08030958 @ =0x0202BBB8
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030958: .4byte 0x0202BBB8
