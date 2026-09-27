	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBoxDialogueSimple
StartBoxDialogueSimple: @ 0x08083600
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808362C @ =0x08CC2A4C
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne _08083630
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _08083638
	.align 2, 0
_0808362C: .4byte 0x08CC2A4C
_08083630:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_08083638:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08083664 @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083664: .4byte 0x08CC2B84
