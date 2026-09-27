	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080565D0
sub_080565D0: @ 0x080565D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08056622
	ldr r1, _08056610 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, _08056614 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805661C
	ldr r0, _08056618 @ =0x02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b _08056622
	.align 2, 0
_08056610: .4byte 0x0201774C
_08056614: .4byte 0x0203E02C
_08056618: .4byte 0x02017758
_0805661C:
	adds r0, r4, #0
	bl Proc_Break
_08056622:
	pop {r4}
	pop {r0}
	bx r0
