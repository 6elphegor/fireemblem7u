	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPostBattleMusic_PlayFanfare
SioPostBattleMusic_PlayFanfare: @ 0x08040238
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0804024C
	movs r0, #0x2d
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	b _08040256
_0804024C:
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
_08040256:
	ldr r0, _0804026C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040268
	movs r0, #0x81
	bl m4aSongNumStart
_08040268:
	pop {r0}
	bx r0
	.align 2, 0
_0804026C: .4byte 0x0202BBF8
