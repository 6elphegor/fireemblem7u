	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxBlackInOutUnit
NewEfxBlackInOutUnit: @ 0x08068994
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080689BC @ =0x08BDB56C
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080689C0
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080689C6
	.align 2, 0
_080689BC: .4byte 0x08BDB56C
_080689C0:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080689C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
