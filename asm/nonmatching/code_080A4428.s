	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4428
sub_080A4428: @ 0x080A4428
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A446A
	ldr r0, _080A4470 @ =0x084130A4
	ldr r1, _080A4474 @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl Proc_Break
_080A446A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4470: .4byte 0x084130A4
_080A4474: .4byte 0x06013800
