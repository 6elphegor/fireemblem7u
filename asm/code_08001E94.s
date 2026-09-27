	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08001E94
sub_08001E94: @ 0x08001E94
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001EBC @ =0x03000014
	ldr r1, _08001EC0 @ =0x03000015
	movs r2, #0
	strb r2, [r1]
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08001EC4 @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001EBC: .4byte 0x03000014
_08001EC0: .4byte 0x03000015
_08001EC4: .4byte 0x02022C60
