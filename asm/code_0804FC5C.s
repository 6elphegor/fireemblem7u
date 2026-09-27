	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FC5C
sub_0804FC5C: @ 0x0804FC5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804FC94 @ =0x0201C784
	ldr r4, _0804FC98 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #8
	bl EfxPalBlackInOut
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804FC8E
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0804FC8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC94: .4byte 0x0201C784
_0804FC98: .4byte 0x02022920
