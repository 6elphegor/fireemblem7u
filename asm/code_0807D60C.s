	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D60C
sub_0807D60C: @ 0x0807D60C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0807D63E
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0807D634 @ =0x0202BBB8
	ands r0, r2
	cmp r0, #0
	beq _0807D638
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	b _0807D63C
	.align 2, 0
_0807D634: .4byte 0x0202BBB8
_0807D638:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
_0807D63C:
	strh r0, [r1, #0xc]
_0807D63E:
	pop {r4}
	pop {r0}
	bx r0
