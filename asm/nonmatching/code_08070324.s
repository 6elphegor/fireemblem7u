	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08070324
sub_08070324: @ 0x08070324
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	str r0, [r7, #0xc]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r4, #0xe
	ldrsh r1, [r0, r4]
	adds r0, r1, #0
	bl GetClassData
	str r0, [r7, #0x10]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r5, #8
	ldrsh r1, [r0, r5]
	str r1, [r7, #0x14]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0xe
	ldrsh r1, [r0, r6]
	str r1, [r7, #0x18]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #4]
	cmp r0, #9
	bls _080703A2
	b _08070778
_080703A2:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080703B4 @ =_080703B8
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080703B0: .4byte 0x08C9D938
_080703B4: .4byte _080703B8
_080703B8: @ jump table
	.4byte _080703E0 @ case 0
	.4byte _08070468 @ case 1
	.4byte _080704E4 @ case 2
	.4byte _08070560 @ case 3
	.4byte _080705E8 @ case 4
	.4byte _0807067C @ case 5
	.4byte _0807067C @ case 6
	.4byte _0807067C @ case 7
	.4byte _0807067C @ case 8
	.4byte _0807067C @ case 9
_080703E0:
	ldr r0, _08070460 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x14
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070460 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x14
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x14]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0xc]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _08070460 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x14
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070464 @ =0x02022C6C
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070460: .4byte 0x08C9D938
_08070464: .4byte 0x02022C6C
_08070468:
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x1c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r2, [r7, #8]
	ldr r3, _080704DC @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _080704E0 @ =0x02022CEE
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_080704DC: .4byte 0x08C9D938
_080704E0: .4byte 0x02022CEE
_080704E4:
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x24
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r2, [r7, #8]
	ldr r3, _08070558 @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _0807055C @ =0x02022CF4
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070558: .4byte 0x08C9D938
_0807055C: .4byte 0x02022CF4
_08070560:
	ldr r0, _080705E0 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x2c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _080705E0 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x2c
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x18]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0x10]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	ldr r1, _080705E0 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x2c
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _080705E4 @ =0x02022D6C
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_080705E0: .4byte 0x08C9D938
_080705E4: .4byte 0x02022D6C
_080705E8:
	ldr r0, _08070674 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070674 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x34
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x1c]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r1, _08070674 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0x10
	ldrsh r1, [r0, r6]
	adds r0, r1, #0
	bl GetItemName
	ldr r1, _08070674 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x34
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070678 @ =0x02022DEC
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070674: .4byte 0x08C9D938
_08070678: .4byte 0x02022DEC
_0807067C:
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #8]
	ldr r3, _0807076C @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	ldr r4, [r7]
	movs r5, #0x64
	muls r4, r5, r4
	adds r3, r3, r4
	adds r1, #8
	adds r4, r1, r3
	movs r1, #0
	ldrsh r3, [r4, r1]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #4]
	subs r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #8
	lsls r3, r2, #5
	adds r1, r3, #7
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, _08070770 @ =0x02022C60
	adds r1, r1, r2
	ldr r2, [r7, #8]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08070774 @ =0x08C9D898
	ldr r5, _0807076C @ =0x08C9D938
	ldr r4, [r5]
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #1
	str r5, [r7, #0x20]
	ldr r6, [r7]
	str r6, [r7, #0x24]
	movs r5, #0x64
	mov r8, r5
	ldr r5, [r7, #0x24]
	mov r6, r8
	muls r6, r5, r6
	str r6, [r7, #0x24]
	ldr r6, [r7, #0x20]
	ldr r5, [r7, #0x24]
	adds r6, r6, r5
	str r6, [r7, #0x20]
	adds r4, #8
	ldr r6, [r7, #0x20]
	adds r5, r4, r6
	movs r6, #0
	ldrsh r4, [r5, r6]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	str r4, [sp, #4]
	movs r3, #0x10
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_0807076C: .4byte 0x08C9D938
_08070770: .4byte 0x02022C60
_08070774: .4byte 0x08C9D898
_08070778:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
