	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088E80
sub_08088E80: @ 0x08088E80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsrs r0, r0, #0x1b
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r4, #0
	bne _08088EE8
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08088ED0
	ldr r2, _08088EC4 @ =0x02023C60
	ldr r0, _08088EC8 @ =0xFFFFF368
	adds r1, r3, r0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _08088ECC @ =0xFFFFF36E
	adds r1, r3, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	b _08088F2A
	.align 2, 0
_08088EC4: .4byte 0x02023C60
_08088EC8: .4byte 0xFFFFF368
_08088ECC: .4byte 0xFFFFF36E
_08088ED0:
	ldr r1, _08088EE4 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	strh r2, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	strh r2, [r0]
	b _08088F2A
	.align 2, 0
_08088EE4: .4byte 0x02023C60
_08088EE8:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08088F18
	ldr r2, _08088F0C @ =0x02023C60
	ldr r4, _08088F10 @ =0xFFFFF768
	adds r0, r3, r4
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _08088F14 @ =0xFFFFF76E
	adds r0, r3, r1
	movs r3, #0xbd
	lsls r3, r3, #1
	adds r1, r2, r3
	b _08088F28
	.align 2, 0
_08088F0C: .4byte 0x02023C60
_08088F10: .4byte 0xFFFFF768
_08088F14: .4byte 0xFFFFF76E
_08088F18:
	ldr r1, _08088F38 @ =0x02023C60
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r2, r1, r4
	strh r0, [r2]
	movs r2, #0xbd
	lsls r2, r2, #1
	adds r1, r1, r2
_08088F28:
	strh r0, [r1]
_08088F2A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088F38: .4byte 0x02023C60
