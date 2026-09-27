	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBoxDialogueExt
StartBoxDialogueExt: @ 0x08083668
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x20]
	ldr r4, _08083698 @ =0x08CC2A4C
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne _0808369C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _080836A4
	.align 2, 0
_08083698: .4byte 0x08CC2A4C
_0808369C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_080836A4:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, sb
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080836D4 @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836D4: .4byte 0x08CC2B84
