	.include "macro.inc"

	.syntax unified

	thumb_func_start InitScanlineBuf
InitScanlineBuf: @ 0x080770F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #4]
_08077100:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _08077108
	b _08077124
_08077108:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r3, _08077120 @ =0x0000F0F0
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077100
	.align 2, 0
_08077120: .4byte 0x0000F0F0
_08077124:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
