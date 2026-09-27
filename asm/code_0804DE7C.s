	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804DE7C
sub_0804DE7C: @ 0x0804DE7C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #8
	bne _0804DEC4
	ldr r6, _0804DECC @ =0x0203E05E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DEBE
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0804DEBE:
	adds r0, r4, #0
	bl Proc_Break
_0804DEC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DECC: .4byte 0x0203E05E
