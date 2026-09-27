	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031600
sub_08031600: @ 0x08031600
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0803166C @ =0x081C4060
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r4, #0
	adds r2, #0x62
	ldrb r2, [r2]
	adds r6, r2, r0
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	adds r0, #1
	lsls r5, r0, #3
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08031674
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08031682
	adds r1, r6, #0
	adds r1, #9
	adds r2, r5, #7
	ldr r3, _08031670 @ =0x08B905B0
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	movs r0, #0xf
	ldrh r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xc
	adds r0, #3
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _08031682
	.align 2, 0
_0803166C: .4byte 0x081C4060
_08031670: .4byte 0x08B905B0
_08031674:
	str r2, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_080263A0
_08031682:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
