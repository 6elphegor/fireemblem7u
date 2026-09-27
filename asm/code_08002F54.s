	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgFromPtr
GetBgFromPtr: @ 0x08002F54
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _08002F70 @ =0x02022C60
	cmp r0, r1
	blo _08002F78
	ldr r0, [r7]
	ldr r1, _08002F74 @ =0x02023460
	cmp r0, r1
	bhs _08002F78
	movs r0, #0
	b _08002FD2
	.align 2, 0
_08002F70: .4byte 0x02022C60
_08002F74: .4byte 0x02023460
_08002F78:
	ldr r0, [r7]
	ldr r1, _08002F8C @ =0x02023460
	cmp r0, r1
	blo _08002F94
	ldr r0, [r7]
	ldr r1, _08002F90 @ =0x02023C60
	cmp r0, r1
	bhs _08002F94
	movs r0, #1
	b _08002FD2
	.align 2, 0
_08002F8C: .4byte 0x02023460
_08002F90: .4byte 0x02023C60
_08002F94:
	ldr r0, [r7]
	ldr r1, _08002FA8 @ =0x02023C60
	cmp r0, r1
	blo _08002FB0
	ldr r0, [r7]
	ldr r1, _08002FAC @ =0x02024460
	cmp r0, r1
	bhs _08002FB0
	movs r0, #2
	b _08002FD2
	.align 2, 0
_08002FA8: .4byte 0x02023C60
_08002FAC: .4byte 0x02024460
_08002FB0:
	ldr r0, [r7]
	ldr r1, _08002FC4 @ =0x02024460
	cmp r0, r1
	blo _08002FCC
	ldr r0, [r7]
	ldr r1, _08002FC8 @ =0x02024C60
	cmp r0, r1
	bhs _08002FCC
	movs r0, #3
	b _08002FD2
	.align 2, 0
_08002FC4: .4byte 0x02024460
_08002FC8: .4byte 0x02024C60
_08002FCC:
	movs r0, #1
	rsbs r0, r0, #0
	b _08002FD2
_08002FD2:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
