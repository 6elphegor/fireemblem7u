	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B198
sub_0800B198: @ 0x0800B198
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080143E0
	ldr r0, _0800B1C0 @ =0x08B90B9C
	bl Proc_EndEach
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B1B8
	bl sub_0806E144
_0800B1B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1C0: .4byte 0x08B90B9C
