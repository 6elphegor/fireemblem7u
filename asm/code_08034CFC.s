	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034CFC
sub_08034CFC: @ 0x08034CFC
	push {lr}
	ldr r0, _08034D14 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08034D1C
	ldr r1, _08034D18 @ =0x0203A85C
	movs r0, #3
	b _08034D20
	.align 2, 0
_08034D14: .4byte 0x03004690
_08034D18: .4byte 0x0203A85C
_08034D1C:
	ldr r1, _08034D2C @ =0x0203A85C
	movs r0, #2
_08034D20:
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08034D2C: .4byte 0x0203A85C
