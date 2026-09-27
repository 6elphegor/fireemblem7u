	.include "macro.inc"

	.syntax unified

	thumb_func_start IsSioBigTransferActive
IsSioBigTransferActive: @ 0x0803D91C
	push {lr}
	ldr r0, _0803D938 @ =0x08B98AF0
	bl Proc_Find
	cmp r0, #0
	bne _0803D940
	ldr r0, _0803D93C @ =0x08B98B10
	bl Proc_Find
	cmp r0, #0
	bne _0803D940
	movs r0, #0
	b _0803D942
	.align 2, 0
_0803D938: .4byte 0x08B98AF0
_0803D93C: .4byte 0x08B98B10
_0803D940:
	movs r0, #1
_0803D942:
	pop {r1}
	bx r1
	.align 2, 0
