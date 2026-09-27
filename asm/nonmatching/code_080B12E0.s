	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B12E0
sub_080B12E0: @ 0x080B12E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1310 @ =0x0202BBB8
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1306
	ldr r1, _080B1314 @ =0x08CE6F48
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
_080B1306:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1310: .4byte 0x0202BBB8
_080B1314: .4byte 0x08CE6F48
