	.include "macro.inc"

	.syntax unified

	thumb_func_start SupportSubScreen_PrepareSupportConvo
SupportSubScreen_PrepareSupportConvo: @ 0x0809D6C8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl UiSupport_GetSupportTalkSong
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D704
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #0x30
	movs r2, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809D714
_0809D704:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809D714:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
