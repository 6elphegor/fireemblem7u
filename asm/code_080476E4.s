	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLinkArenaMUDeathFade
StartLinkArenaMUDeathFade: @ 0x080476E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0804775C @ =0x08C9D044
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r1, _08047760 @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r6, [r2]
	ands r1, r6
	strb r1, [r2]
	ldrh r0, [r0]
	lsrs r1, r0, #1
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl sub_08047670
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _08047764 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08047754
	movs r0, #0xd6
	bl m4aSongNumStart
_08047754:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804775C: .4byte 0x08C9D044
_08047760: .4byte 0x03002870
_08047764: .4byte 0x0202BBF8
