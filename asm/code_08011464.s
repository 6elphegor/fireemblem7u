	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011464
sub_08011464: @ 0x08011464
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011490
	ldr r0, _0801148C @ =0x08B92140
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	movs r0, #2
	b _08011492
	.align 2, 0
_0801148C: .4byte 0x08B92140
_08011490:
	movs r0, #0
_08011492:
	pop {r4, r5}
	pop {r1}
	bx r1
