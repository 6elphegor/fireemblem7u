	.include "macro.inc"

	.syntax unified

	thumb_func_start OnHBlankBoth
OnHBlankBoth: @ 0x08002DC8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08002DF4 @ =0x03002924
	ldr r1, [r0]
	cmp r1, #0
	beq _08002DDC
	ldr r0, _08002DF4 @ =0x03002924
	ldr r4, [r0]
	bl _call_via_r4
_08002DDC:
	ldr r0, _08002DF8 @ =0x03002F38
	ldr r1, [r0]
	cmp r1, #0
	beq _08002DEC
	ldr r0, _08002DF8 @ =0x03002F38
	ldr r4, [r0]
	bl _call_via_r4
_08002DEC:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002DF4: .4byte 0x03002924
_08002DF8: .4byte 0x03002F38
