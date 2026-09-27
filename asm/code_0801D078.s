	.include "macro.inc"

	.syntax unified

	thumb_func_start MoveLimitViewChange_OnInit
MoveLimitViewChange_OnInit: @ 0x0801D078
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D0A0 @ =0x083FDC9C
	ldr r1, _0801D0A4 @ =0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	ldr r1, _0801D0A8 @ =0x0202BBB8
	movs r0, #1
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801D0AC
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b _0801D0BC
	.align 2, 0
_0801D0A0: .4byte 0x083FDC9C
_0801D0A4: .4byte 0x06005080
_0801D0A8: .4byte 0x0202BBB8
_0801D0AC:
	ldr r1, _0801D0C4 @ =0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r4, #0
	bl Proc_End
_0801D0BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D0C4: .4byte 0x06005000
