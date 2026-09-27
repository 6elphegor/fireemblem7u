	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC54C
sub_080AC54C: @ 0x080AC54C
	push {r4, r5, r6, r7, lr}
	ldr r7, [r0, #0x14]
	ldr r0, _080AC584 @ =0x0201EA9C
	movs r6, #0x40
	adds r5, r0, #0
	adds r5, #0x30
	movs r4, #1
_080AC55A:
	ldrb r3, [r5]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, #0x18
	adds r1, r6, #0
	adds r2, r3, #0
	bl DrawSoundRoomVolumeGraphSprites
	adds r6, #8
	adds r5, #0x31
	subs r4, #1
	cmp r4, #0
	bge _080AC55A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC584: .4byte 0x0201EA9C
