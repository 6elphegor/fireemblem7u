	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047FA8
sub_08047FA8: @ 0x08047FA8
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08047FEC @ =0x081D55DE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08047FF0 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08047FE4
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r0]
	adds r2, #0x10
	ldr r3, _08047FF4 @ =0x02022860
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePalSync
_08047FE4:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047FEC: .4byte 0x081D55DE
_08047FF0: .4byte 0x0203DCE8
_08047FF4: .4byte 0x02022860
